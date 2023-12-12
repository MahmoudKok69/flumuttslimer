import 'package:flumuttslimer/core/bottom_nagigation_bar/bottom_nav_bar_controller.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_controller.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_controller.dart';
import 'package:flumuttslimer/roles/student/features/home/home_controller.dart';
import 'package:flumuttslimer/roles/student/features/student_profile/student_profile_controller.dart';
import 'package:get/get.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AzkarController());
    Get.lazyPut(() => QuranController());
    Get.lazyPut(() => StudentProfileController());
  }
}
