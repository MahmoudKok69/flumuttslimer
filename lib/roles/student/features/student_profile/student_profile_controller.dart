import 'package:get/get.dart';

class StudentProfileController extends GetxController {
  String name = 'Test';

  changeText() {
    name = name * 10;
    update(['update_text', 'update_text2']);
  }
}
