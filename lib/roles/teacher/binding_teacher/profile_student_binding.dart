import 'package:flumuttslimer/roles/teacher/profile_student/profile_student_controller.dart';

import 'package:get/get.dart';

class Profile_studentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TStudentsProfileController>(() => TStudentsProfileController());
  }
}
