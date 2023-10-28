import 'package:flumuttslimer/roles/student/features/Quran/Quran_controller.dart';
import 'package:get/get.dart';

class SQuranBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuranController>(() => QuranController());
  }
}
