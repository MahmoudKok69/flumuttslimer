import 'package:flumuttslimer/roles/teacher/profile_student/profile_student_controller.dart';
import 'package:flumuttslimer/roles/teacher/welcome/welcome_controller.dart';

import 'package:get/get.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
