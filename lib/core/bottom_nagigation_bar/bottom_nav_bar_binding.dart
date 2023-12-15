import 'package:flumuttslimer/core/bottom_nagigation_bar/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
  }
}
