import 'package:flumuttslimer/roles/student/features/home/home_controller.dart';
import 'package:flumuttslimer/roles/teacher/ad/ad_controller.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/Home_teacher_controller.dart';
import 'package:flumuttslimer/roles/teacher/my_group/my_group_controller.dart';
import 'package:flumuttslimer/roles/teacher/new_upd_group/add_group_controller.dart';

import 'package:get/get.dart';

class Add_groupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Addgroub_Controller>(() => Addgroub_Controller());
  }
}
