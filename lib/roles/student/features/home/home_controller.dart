import 'package:get/get.dart';

class HomeController extends GetxController {
  int index = 0;

  updateNavBar(int newIndex) {
    index = newIndex;
    update(['nav_bar']);
  }
}
