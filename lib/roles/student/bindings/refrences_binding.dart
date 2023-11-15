import 'package:flumuttslimer/roles/student/features/refrences/refrences_contorller.dart';
import 'package:get/get.dart';

class RefrencesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RefrencesController>(() => RefrencesController());
  }
}
