import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:workiom/app/data/config/app_font_style.dart';
import 'package:workiom/app/data/config/config.dart';
import 'package:workiom/app/routes/app_pages.dart';

import '../controllers/on_board_controller.dart';

/// On board view
class OnBoardView extends GetView<OnBoardController> {
  /// Constructor
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              // Get.back<void>();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.k4E86F7,
            ),
          ),
          titleSpacing: 0,
          backgroundColor: AppColors.kffffff,
          title: Text(
            'Sign In',
            style: AppFontStyles.rubik(
              color: AppColors.k4E86F7,
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Create your free account',
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
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  AppImages.googleIcon,
                  width: 16,
                  height: 16,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.kF4F4F4,
                  fixedSize: Size(context.width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                label: Text(
                  'Continue with Google',
                  style: AppFontStyles.rubik(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.k000000,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: Text(
                    'Or',
                    style: AppFontStyles.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.k555555,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed<void>(
                    Routes.SIGN_IN,
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.k4E86F7,
                  fixedSize: Size(context.width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      'Continue with email',
                      style: AppFontStyles.rubik(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kffffff,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 24,
                      height: 16,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.kffffff.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.asset(
                        AppImages.reverse,
                        width: 10,
                        height: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _buildTermsConditionText(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    AppImages.global,
                    width: 13,
                    height: 13,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'English',
                    style: AppFontStyles.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.k555555,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down_rounded,
                  )
                ],
              ),
              _buildBottomText()
            ],
          ),
        ),
      );

  Row _buildBottomText() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Stay organized with',
            style: AppFontStyles.rubik(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.k555555,
            ),
          ),
          const SizedBox(width: 10),
          Image.asset(
            AppImages.appLogo,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 3),
          Image.asset(
            AppImages.workiom,
            height: 31,
            width: 70,
          ),
        ],
      );

  Widget _buildTermsConditionText() => Center(
        child: Text.rich(
          TextSpan(
            children: <InlineSpan>[
              TextSpan(
                text: 'By signing up, you agree ',
                style: AppFontStyles.rubik(
                  color: AppColors.k555555,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              TextSpan(
                text: 'Terms Of Service\n',
                style: AppFontStyles.rubik(
                  color: AppColors.k555555,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: ' And ',
                style: AppFontStyles.rubik(
                  color: AppColors.k555555,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: AppFontStyles.rubik(
                  color: AppColors.k555555,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );
}
