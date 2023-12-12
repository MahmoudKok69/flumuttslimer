import 'package:get/get.dart';

class WelcomeController extends GetxController {
  bool isStudent = false;
  void setvalue_choose() {
    isStudent = !isStudent;
    print('student :$isStudent');
    update(['setvalue_choose']);
  }

  new_url() {}
}
