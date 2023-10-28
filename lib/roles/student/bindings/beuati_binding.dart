import 'package:flumuttslimer/roles/student/features/beauti/beauti_controller.dart';
import 'package:get/get.dart';

class BeuatiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeuatiController>(() => BeuatiController());
  }
}
