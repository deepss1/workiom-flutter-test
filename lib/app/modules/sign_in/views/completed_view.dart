import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workiom/app/data/config/config.dart';
import 'package:workiom/app/data/local/user_provider.dart';
import 'package:workiom/app/ui/components/bottom_text.dart';

import '../../../data/config/app_font_style.dart';

// class CompletedView extends StatelessWidget {
// const CompletedView({Key? key}) : super(key: key);
//
// @override
// Widget build(BuildContext context) => Scaffold(
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Center(
//             child: TextButton(
//               onPressed: () {
//                 UserProvider.onLogout();
//               },
//               child: Text(
//                 'Logout',
//                 style: AppFontStyles.rubik(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 15,
//                   color: AppColors.k4E86F7,
//                 ),
//               ),
//             ),
//           ),
//           const BottomText().paddingOnly(
//             bottom: 20,
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text.rich(
//               TextSpan(
//                 children: <InlineSpan>[
//                   TextSpan(
//                     text: 'Thank you for choosing\nWorkiom  ',
//                     style: AppFontStyles.rubik(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.k000000,
//                     ),
//                   ),
//                   WidgetSpan(
//                     child: Image.asset(
//                       AppImages.appLogo,
//                       height: 25,
//                       width: 25,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
// }
