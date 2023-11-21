import 'package:flumuttslimer/roles/teacher/auth/login_teacher/login_teacher_controller.dart';
import 'package:get/get.dart';

class LoginteacherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Login_teacher_Controller>(() => Login_teacher_Controller());
  }
}
