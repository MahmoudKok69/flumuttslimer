import 'package:flumuttslimer/roles/student/features/auth/login/login_controller.dart';
import 'package:flumuttslimer/roles/student/features/beauti/beauti_controller.dart';
import 'package:flumuttslimer/roles/student/features/home/home_controller.dart';
import 'package:get/get.dart';

class BeuatiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeuatiController>(() => BeuatiController());
  }
}
