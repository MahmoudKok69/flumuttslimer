import 'package:flumuttslimer/roles/student/features/student_profile/student_profile_controller.dart';
import 'package:get/get.dart';

class StudentProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentProfileController>(
      () => StudentProfileController(),
    );
  }
}
