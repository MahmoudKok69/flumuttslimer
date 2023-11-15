import 'package:flumuttslimer/roles/student/features/auth/register/register_controller.dart';
import 'package:flumuttslimer/roles/student/features/student_profile/student_profile_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class StudentProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentProfileController>(
      () => StudentProfileController(),
    );
  }
}
