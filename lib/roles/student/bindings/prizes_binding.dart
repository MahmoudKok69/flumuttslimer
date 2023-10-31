import 'package:flumuttslimer/roles/student/features/Azkar/azkar_controller.dart';
import 'package:flumuttslimer/roles/student/features/prizes/prizes_controller.dart';
import 'package:get/get.dart';

class PrizesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrizesController>(() => PrizesController());
  }
}
