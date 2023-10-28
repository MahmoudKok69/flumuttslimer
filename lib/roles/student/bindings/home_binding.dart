import 'package:flumuttslimer/roles/student/features/home/home_controller.dart';
import 'package:get/get.dart';

class SHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
