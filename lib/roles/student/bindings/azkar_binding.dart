import 'package:flumuttslimer/roles/student/features/Azkar/azkar_controller.dart';
import 'package:get/get.dart';

class SAzkarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AzkarController>(() => AzkarController());
  }
}
