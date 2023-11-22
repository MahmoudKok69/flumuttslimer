import 'package:get/get.dart';

import '../Home_teacher/home_teacher_controller.dart';

class HometeacherBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeTeacherController>(HomeTeacherController());
  }
}
