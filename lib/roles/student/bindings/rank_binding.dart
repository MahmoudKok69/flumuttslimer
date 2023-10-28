import 'package:flumuttslimer/roles/student/features/rank/rank_controller.dart';
import 'package:get/get.dart';

class RankBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankController>(() => RankController());
  }
}
