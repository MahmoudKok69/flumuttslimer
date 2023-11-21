import 'package:flumuttslimer/roles/teacher/my_group/my_group_controller.dart';
import 'package:get/get.dart';

class MyGroupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Mygroub_Controller>(() => Mygroub_Controller());
  }
}
