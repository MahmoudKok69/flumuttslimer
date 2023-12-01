import 'package:get/get.dart';

class WelcomeController extends GetxController {
  bool isStudent = false;
  bool isTeacher = true;
  void setvalue_choose() {
    isStudent = !isStudent;
    isTeacher = !isTeacher;
    print('student :$isStudent, teacher :$isTeacher');
    update(['setvalue_choose']);
  }

  new_url() {}
}
