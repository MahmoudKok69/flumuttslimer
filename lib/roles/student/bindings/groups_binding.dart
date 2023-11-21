import 'package:flumuttslimer/roles/student/features/groups/groups_controller.dart';
import 'package:get/get.dart';

class sGroupsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SGroupsController>(() => SGroupsController());
  }
}
