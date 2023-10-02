import 'package:get/get.dart';
import 'package:workiom/app/data/provider/auth_provider.dart';

class CompletedViewController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getCurrentInfo();
    super.onInit();
  }

  Future<void> getCurrentInfo() async {
    try {
      isLoading(true);
      await AuthProvider.getLoginInfo();
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
