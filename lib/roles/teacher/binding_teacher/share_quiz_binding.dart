import 'package:flumuttslimer/roles/teacher/profile_student/profile_student_controller.dart';
import 'package:flumuttslimer/roles/teacher/quize/controllers/quiz_controller.dart';
import 'package:flumuttslimer/roles/teacher/quize/controllers/share_quiz_controller.dart';

import 'package:get/get.dart';

class ShareQuizBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShareQuizController>(() => ShareQuizController());
  }
}
