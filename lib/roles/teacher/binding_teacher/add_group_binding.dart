import 'package:flumuttslimer/roles/teacher/new_upd_group/add_group_controller.dart';

import 'package:get/get.dart';

class Add_groupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddGroupController>(() => AddGroupController());
  }
}
