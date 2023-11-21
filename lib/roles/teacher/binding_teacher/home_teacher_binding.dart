import 'package:flumuttslimer/roles/student/features/home/home_controller.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/Home_teacher_controller.dart';

import 'package:get/get.dart';

class HometeacherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeTeacherController>(() => HomeTeacherController());
  }
}
