import 'package:flumuttslimer/roles/student/features/home/home_controller.dart';
import 'package:flumuttslimer/roles/teacher/ad/ad_controller.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/Home_teacher_controller.dart';

import 'package:get/get.dart';

class AdBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Ad_Controller>(() => Ad_Controller());
  }
}
