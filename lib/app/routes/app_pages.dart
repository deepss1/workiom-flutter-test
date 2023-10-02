import 'package:get/get.dart';

import '../modules/completed_view/bindings/completed_view_binding.dart';
import '../modules/completed_view/views/completed_view_view.dart';
import '../modules/on_board/bindings/on_board_binding.dart';
import '../modules/on_board/views/on_board_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ON_BOARD;

  static final routes = [
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARD,
      page: () => const OnBoardView(),
      binding: OnBoardBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETED_VIEW,
      page: () => CompletedViewView(),
      binding: CompletedViewBinding(),
    ),
  ];
}
