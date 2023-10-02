import 'package:get/get.dart';

import '../controllers/completed_view_controller.dart';

class CompletedViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompletedViewController>(
      () => CompletedViewController(),
    );
  }
}
