import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workiom/app/routes/app_pages.dart';
import '../../data/config/app_font_style.dart';
import '../../data/config/config.dart';

///Custom button
class AppButton extends StatelessWidget {
  /// App button
  AppButton({
    required this.onPressed,
    required this.buttonText,
    Key? key,
    this.margin,
    this.padding,
    this.buttonSize,
    this.radius,
    this.buttonTextStyle,
    this.buttonColor,
    this.buttonTextColor,
    this.disabledBackgroundColor,
    this.shape,
    this.shadowColor,
    this.elevation,
    this.isLoading = false,
  }) : super(key: key);

  // /// App button with icon
  // AppButton.icon({
  //   required Widget child,
  //   this.buttonText,
  //   required this.onPressed,
  //   this.margin,
  //   this.padding,
  //   this.buttonSize,
  //   this.radius,
  //   this.buttonTextStyle,
  //   this.buttonColor,
  //   this.buttonTextColor,
  //   this.disabledBackgroundColor,
  //   this.shape,
  //   this.shadowColor,
  //   this.elevation,
  //   this.isLoading = false,
  // }) {
  //   _child = buttonText?.isEmpty ?? true
  //       ? child
  //       : Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             child,
  //             20.horizontalSpace,
  //             Text(
  //               buttonText ?? '',
  //               style: GoogleFonts.manrope(
  //                 fontSize: 50.sp,
  //                 fontWeight: FontWeight.w600,
  //                 color: AppColors.kffffff,
  //               ),
  //             )
  //           ],
  //         );
  // }
  //
  // Widget? _child;

  /// Button Text
  final String? buttonText;

  final TextStyle? buttonTextStyle;

  /// on pressed
  final void Function()? onPressed;

  /// Margin
  final EdgeInsetsGeometry? margin;

  /// Padding
  final EdgeInsetsGeometry? padding;

  /// Button size
  /// Default is  :
  /// Size(
  ///  Get.width,
  ///  130.h,
  /// )
  final Size? buttonSize;

  /// Button radius
  final double? radius;

  /// Button Color
  final Color? buttonColor;

  /// Button Text Color
  final Color? buttonTextColor;

  /// Button disabled Background Color
  final Color? disabledBackgroundColor;

  final Color? shadowColor;

  final OutlinedBorder? shape;

  final double? elevation;

  ///if true then show loading widget
  final bool isLoading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: ElevatedButton(
          onPressed: onPressed ??
              () {
                Get.toNamed<void>(
                  Routes.SIGN_IN,
                );
              },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: buttonColor ?? AppColors.k4E86F7,
            fixedSize: Size(context.width, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColors.kffffff,
                  strokeWidth: 3,
                )
              : Row(
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      buttonText ?? 'Continue with email',
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
      );
}
