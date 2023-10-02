import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:workiom/app/data/local/local_store.dart';

import '../../../data/config/app_font_style.dart';
import '../../../data/config/config.dart';
import '../../../data/local/user_provider.dart';
import '../../../ui/components/bottom_text.dart';
import '../controllers/completed_view_controller.dart';

class CompletedViewView extends GetView<CompletedViewController> {
  CompletedViewView({Key? key}) : super(key: key);

  @override
  final CompletedViewController controller =
      Get.find<CompletedViewController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: TextButton(
                onPressed: () {
                  UserProvider.onLogout();
                },
                child: Text(
                  'Logout',
                  style: AppFontStyles.rubik(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColors.k4E86F7,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                logW('${LocalStore.userEmail()} || ${LocalStore.tenantName()}');
              },
              child: const BottomText().paddingOnly(
                bottom: 20,
              ),
            ),
          ],
        ),
        body: Obx(() => Center(
              child: controller.isLoading()
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'Thank you for choosing\nWorkiom  ',
                                style: AppFontStyles.rubik(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.k000000,
                                ),
                              ),
                              WidgetSpan(
                                child: Image.asset(
                                  AppImages.appLogo,
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Email: ${LocalStore.userEmail() ?? ''}',
                              style: AppFontStyles.rubik(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.k000000,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Tenant Name : ${LocalStore.tenantName() ?? ''}',
                              style: AppFontStyles.rubik(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.k000000,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            )),
      );
}
