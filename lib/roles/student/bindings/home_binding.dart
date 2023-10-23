import 'package:flumuttslimer/roles/student/features/auth/login/login_controller.dart';
import 'package:flumuttslimer/roles/student/features/home/home_controller.dart';
import 'package:get/get.dart';

class LHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
