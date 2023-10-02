import 'package:get/get.dart';

class OnBoardController extends GetxController {
  //TODO: Implement OnBoardController

  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
