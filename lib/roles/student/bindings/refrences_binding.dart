import 'package:flumuttslimer/roles/student/features/refrences/refrences_contorller.dart';
import 'package:get/get.dart';

class PrizesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RefrencesController>(() => RefrencesController());
  }
}
