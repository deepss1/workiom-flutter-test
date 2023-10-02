import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:workiom/app/data/config/config.dart';
import 'package:workiom/app/data/config/filed_validation.dart';
import 'package:workiom/app/modules/sign_in/views/company_fill_page.dart';
import 'package:workiom/app/ui/components/app_button.dart';
import 'package:workiom/app/ui/components/app_text_field.dart';
import 'package:workiom/app/ui/components/bottom_text.dart';

import '../../../data/config/app_font_style.dart';

import '../controllers/sign_in_controller.dart';

/// Sign in view
class SignInView extends GetView<SignInController> {
  /// Constructor
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
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
        bottomNavigationBar: const BottomText().paddingOnly(bottom: 20),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Obx(() => controller.isLoading()
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
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
                        key: controller.signInForm,
                        onChanged: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AppTextField(
                              name: 'email',
                              controller: controller.emailController,
                              title: 'Enter you email',
                              hintText: 'Enter you email',
                              autofillHints: const <String>[
                                AutofillHints.email,
                              ],
                              validator: AppValidation.emailValidation,
                              keyboardType: TextInputType.emailAddress,
                              prefix: const Icon(
                                Icons.mail_outline_rounded,
                                color: AppColors.k000000,
                                size: 20,
                              ).paddingOnly(top: 5),
                              suffix: GestureDetector(
                                onTap: () {
                                  controller.emailController.clear();
                                },
                                child: Image.asset(
                                  AppImages.clear,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Obx(() => AppTextField(
                                  name: 'password',
                                  keyboardType: TextInputType.text,
                                  controller: controller.passwordController,
                                  title: 'Your password',
                                  validator: AppValidation.passwordValidation,
                                  obSecureText: controller.isSecure(),
                                  onChanged: (String? p0) {
                                    controller.percentage(controller
                                        .calculatePasswordStrength(p0 ?? ''));
                                    controller.percentage.refresh();
                                    logE(controller.percentage());
                                    if (controller.percentage() == 100) {
                                      controller.isValidate(true);
                                    }
                                    return null;
                                  },
                                  hintText: 'Enter you password',
                                  prefix: Image.asset(
                                    AppImages.lockPass,
                                    height: 20,
                                    width: 20,
                                  ).paddingOnly(top: 5),
                                  suffix: GestureDetector(
                                    onTap: () {
                                      controller.isSecure.toggle();
                                    },
                                    child: Icon(
                                      controller.isSecure()
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 18,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: LinearProgressIndicator(
                            value: controller.percentage() / 100,
                            backgroundColor: AppColors.kF4F4F4,
                            color: controller.getColors(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildPassowrdValidateText(),
                      // const Spacer(),
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(
                        () => AppButton(
                          onPressed: () {
                            if (controller.signInForm.currentState
                                    ?.saveAndValidate() ??
                                false) {
                              if (controller.isValidate()) {
                                Get.to<void>(
                                  CompanyFormPage(),
                                );
                              }
                            }
                          },
                          buttonColor: controller.isValidate()
                              ? AppColors.k4E86F7
                              : AppColors.kB5B5B5,
                          buttonText: 'Confirm password',
                        ),
                      ),
                    ],
                  ),
                )),
        ),
      );

  Widget _buildPassowrdValidateText() => Obx(
        () => Column(
          children: <Widget>[
            _buildIconText(
              lead: Icon(
                controller.percentage() > 75
                    ? Icons.check
                    : Icons.warning_amber_rounded,
                color: controller.percentage() > 75
                    ? Colors.green
                    : AppColors.kF5C044,
                size: 18,
              ),
              text: 'Not enought strong',
              titleStyle: AppFontStyles.rubik(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.k373737,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            _buildIconText(
              isValidate: controller.validateRulesList[0],
            ),
            const SizedBox(
              height: 5,
            ),
            if (controller.rulesList[0])
              _buildIconText(
                text: 'Passwords must have at least one uppercase ('
                    'A'
                    '-'
                    'Z'
                    ').',
                isValidate: controller.validateRulesList[1],
              ),
            if (controller.rulesList[1])
              _buildIconText(
                text: 'Passwords must have at least one lowercase ('
                    'a'
                    '-'
                    'z'
                    ').',
                isValidate: controller.validateRulesList[2],
              ),
            if (controller.rulesList[2])
              _buildIconText(
                text: 'Passwords must have at least one digit ('
                    '0'
                    '-'
                    '9.',
                isValidate: controller.validateRulesList[3],
              ),
            if (controller.rulesList[3])
              _buildIconText(
                text: 'Passwords must have at least one special character ('
                    '@'
                    '\$'
                    '&'
                    '%',
                isValidate: controller.validateRulesList[4],
              )
          ],
        ),
      );

  Widget _buildIconText({
    String? text,
    IconData? icon,
    Color? iconColor,
    TextStyle? titleStyle,
    Widget? lead,
    bool isValidate = false,
  }) =>
      Row(
        children: <Widget>[
          lead ??
              Icon(
                isValidate ? Icons.check : Icons.close,
                color: isValidate ? Colors.green : AppColors.kff0000,
                size: 15,
              ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text ??
                'Passwords must have at least ${controller.passwordSettings().setting?.requiredLength} characters',
            style: titleStyle ??
                AppFontStyles.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.k555555,
                ),
          ),
        ],
      );
}
