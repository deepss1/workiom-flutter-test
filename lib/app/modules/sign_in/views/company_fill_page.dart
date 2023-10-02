import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:workiom/app/data/config/filed_validation.dart';
import 'package:workiom/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:workiom/app/ui/components/app_button.dart';
import 'package:workiom/app/ui/components/app_text_field.dart';
import 'package:workiom/app/ui/components/bottom_text.dart';

import '../../../data/config/app_font_style.dart';
import '../../../data/config/config.dart';

/// Company form page
class CompanyFormPage extends GetView<SignInController> {
  /// Constructor
  CompanyFormPage({Key? key}) : super(key: key);

  @override
  final SignInController controller = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: const BottomText().paddingOnly(bottom: 20),
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back<void>();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.k4E86F7,
            ),
          ),
          titleSpacing: 0,
          backgroundColor: AppColors.kffffff,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Enter a strong password',
                style: AppFontStyles.rubik(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.k000000,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Let\'s start an amazing journey!',
                    style: AppFontStyles.rubik(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColors.k555555,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    AppImages.handSkakeImage,
                    width: 22,
                    height: 22,
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              FormBuilder(
                key: controller.companyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppTextField(
                      name: 'companyName',
                      controller: controller.teamNameController,
                      title: 'Your  company or team name',
                      hintText: 'Workspace name*',
                      validator: AppValidation.temamNameValidation,
                      onChanged: (String? p0) {
                        controller.checkTeamNameAPI(name: p0);
                        return null;
                      },
                      prefix: Image.asset(
                        AppImages.people,
                        color: AppColors.k000000,
                        height: 16,
                        width: 16,
                      ).paddingOnly(top: 5),
                      suffixIcon: Obx(
                        () => controller.isLoadName()
                            ? const SizedBox(
                                child: CircularProgressIndicator(
                                  strokeWidth: 1.5,
                                ),
                                width: 20,
                                height: 20,
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    '.workiom.com',
                                    style: AppFontStyles.rubik(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.k747474,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Obx(
                      () => !controller.isNameChecked()
                          ? Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'This company or team name already taken',
                                  style: AppFontStyles.rubik(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: AppColors.kff0000,
                                  ),
                                ).paddingSymmetric(horizontal: 20),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AppTextField(
                      name: 'firstName',
                      controller: controller.firstNameController,
                      title: 'Your first name',
                      hintText: 'Enter your First name',
                      autofillHints: [
                        AutofillHints.givenName,
                      ],
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.name,
                      validator: AppValidation.firstNameValidation,
                      prefix: const Icon(
                        Icons.format_align_left_outlined,
                        color: AppColors.k000000,
                        size: 20,
                      ).paddingOnly(top: 5),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AppTextField(
                      name: 'lastName',
                      autofillHints: const [
                        AutofillHints.familyName,
                      ],
                      textCapitalization: TextCapitalization.sentences,
                      title: 'Your last name',
                      hintText: 'Enter your Last name',
                      controller: controller.lastNameController,
                      validator: AppValidation.lastNameValidation,
                      prefix: const Icon(
                        Icons.format_align_left_outlined,
                        color: AppColors.k000000,
                        size: 20,
                      ).paddingOnly(top: 5),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(() => AppButton(
                    isLoading: controller.isLoading(),
                    onPressed: () {
                      if (controller.companyForm.currentState
                              ?.saveAndValidate() ??
                          false) {
                        controller.registerUser();
                      }
                    },
                    buttonColor: controller.isNameChecked()
                        ? AppColors.k4E86F7
                        : AppColors.kB5B5B5,
                    buttonText: 'Create Workspace',
                  )),
            ],
          ),
        ),
      );
}
