import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  int index = 0;
  selectIndex(int newIndex) {
    index = newIndex;
    update(['nav_bar']);
  }
}
