// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:workiom/app/data/config/config.dart';
import 'package:workiom/app/data/models/password_valid.dart';
import 'package:workiom/app/data/provider/auth_provider.dart';
import 'package:workiom/app/routes/app_pages.dart';
import '../../../data/models/editions.dart';

class SignInController extends GetxController {
  RxBool isSecure = true.obs;
  final RxInt count = 0.obs;
  final GlobalKey<FormBuilderState> signInForm = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> companyForm = GlobalKey<FormBuilderState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();
  Rx<SettingResult> passwordSettings = SettingResult().obs;
  RxBool isLoading = false.obs;
  RxBool isCurrect = false.obs;
  RegExp numReg = RegExp(r'.*[0-9].*');
  RegExp letterReg = RegExp(r'.*[A-Za-z].*');
  RegExp specialCharReg = RegExp(r'[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]');
  RxBool isValidate = false.obs;
  RxBool isNameChecked = true.obs;
  RxDouble percentage = 0.0.obs;
  RxBool isLoadName = false.obs;
  RxList<bool> rulesList = <bool>[].obs;
  RxList<bool> validateRulesList = <bool>[
    false,
    false,
    false,
    false,
    false,
  ].obs;

  Rx<EditionResult> editions = EditionResult().obs;

  @override
  void onInit() {
    settingPassword();
    super.onInit();
  }

  Future<void> getEditionsData() async {
    editions(
      await AuthProvider.getEditionsForSelect(),
    );
    editions.refresh();
  }

  Future<void> settingPassword() async {
    try {
      isLoading(true);
      passwordSettings(
        await AuthProvider.getPasswordValdation(),
      );
      rulesList(<bool>[
        passwordSettings().setting?.requireUppercase ?? false,
        passwordSettings().setting?.requireLowercase ?? false,
        passwordSettings().setting?.requireDigit ?? false,
        passwordSettings().setting?.requireNonAlphanumeric ?? false,
      ]);

      await getEditionsData();
    } finally {
      isLoading(false);
    }
  }

  double calculatePasswordStrength(String password) {
    int varifiedCount = 0;
    final Setting? passwordRules = passwordSettings().setting;
    final int numSatisfiedRules = <bool?>[
      passwordRules?.requiredLength != 0,
      passwordRules?.requireUppercase,
      passwordRules?.requireLowercase,
      passwordRules?.requireDigit,
      passwordRules?.requireNonAlphanumeric,
    ].where((bool? rule) => rule ?? true).length;

    // int totalRules = 5; // Total number of rules
    // final double pr = (numSatisfiedRules / totalRules) * 100;

    logWTF('${passwordRules?.requiredLength}   ${password.length}');
    for (final bool element in validateRulesList(
      <bool>[
        password.length >= (passwordRules?.requiredLength ?? 0),
        (passwordRules?.requireUppercase ?? false)
            ? password.contains(RegExp(r'[A-Z]'))
            : false,
        (passwordRules?.requireLowercase ?? false)
            ? password.contains(RegExp(r'[a-z]'))
            : false,
        (passwordRules?.requireDigit ?? false)
            ? password.contains(RegExp(r'[0-9]'))
            : false,
        (passwordRules?.requireNonAlphanumeric ?? false)
            ? password.contains(RegExp(r'[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]'))
            : false,
      ],
    )) {
      logW(element);
      if (element) {
        varifiedCount = varifiedCount + 1;
      }
    }

    final double pr = (varifiedCount / numSatisfiedRules) * 100;

    // final int lengthScore =
    //     password.length >= (passwordSettings().setting?.requiredLength ?? 0)
    //         ? 25
    //         : 0;
    // final int uppercaseScore =
    //     (passwordSettings().setting?.requireUppercase ?? false)
    //         ? (password.contains(RegExp(r'[A-Z]')) ? 25 : 0)
    //         : 25;
    // final int lowercaseScore =
    //     (passwordSettings().setting?.requireLowercase ?? false)
    //         ? (password.contains(RegExp(r'[a-z]')) ? 25 : 0)
    //         : 25;
    // final int numbersScore = (passwordSettings().setting?.requireDigit ?? false)
    //     ? (password.contains(RegExp(r'[0-9]')) ? 25 : 0)
    //     : 25;
    // final int specialChar =
    //     (passwordSettings().setting?.requireNonAlphanumeric ?? false)
    //         ? (password.contains(specialCharReg) ? 10 : 0)
    //         : 25;
    //
    // return (lengthScore +
    //         uppercaseScore +
    //         lowercaseScore +
    //         numbersScore +
    //         specialChar)
    //     .toDouble();
    return pr;
  }

  Color getColors() {
    if (percentage() < 25) {
      return Colors.red;
    } else if (percentage() < 75) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  Future<void> registerUser() async {
    try {
      isLoading(true);
      final bool isValid = await AuthProvider.registerApi(
        emailAddress: emailController.text,
        fName: firstNameController.text,
        password: passwordController.text,
        lastName: lastNameController.text,
        userName: teamNameController.text,
        editionsId:
            editions().editionsWithFeatures?.first.edition?.id.toString(),
      );
      if (isValid) {
        await AuthProvider.loginApi(
          userName: teamNameController.text,
          password: passwordController.text,
          emailAddress: emailController.text,
        ).then((bool value) {
          isLoading(false);
          if (value) {
            Get.offAllNamed<void>(
              Routes.COMPLETED_VIEW,
            );
          }
        });
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> checkTeamNameAPI({String? name}) async {
    await 0.7.delay(
      () async {
        try {
          isLoadName(true);
          final bool isChecked = await AuthProvider.checkTeamName(
            teamName: name,
          );
          isNameChecked(isChecked);
          isNameChecked.refresh();
        } finally {
          isLoadName(false);
        }
      },
    );
  }
}
