import 'package:flutter/material.dart';

import '../../data/config/app_font_style.dart';
import '../../data/config/config.dart';

/// Bottom text
class BottomText extends StatelessWidget {
  /// Constructor
  const BottomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
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
}
