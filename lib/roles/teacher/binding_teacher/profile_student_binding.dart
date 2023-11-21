import 'package:flumuttslimer/roles/student/features/home/home_controller.dart';
import 'package:flumuttslimer/roles/teacher/ad/ad_controller.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/Home_teacher_controller.dart';
import 'package:flumuttslimer/roles/teacher/profile_student/profile_student_controller.dart';

import 'package:get/get.dart';

class Profile_studentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Profile_Student_Controller>(() => Profile_Student_Controller());
  }
}
