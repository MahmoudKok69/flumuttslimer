import 'package:flumuttslimer/roles/student/features/Azkar/azkar_controller.dart';
import 'package:flumuttslimer/roles/student/features/auth/login/login_controller.dart';
import 'package:flumuttslimer/roles/student/features/home/home_controller.dart';
import 'package:get/get.dart';

class SAzkarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AzkarController>(() => AzkarController());
  }
}
