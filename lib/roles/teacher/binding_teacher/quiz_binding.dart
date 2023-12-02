import 'package:flumuttslimer/roles/teacher/profile_student/profile_student_controller.dart';
import 'package:flumuttslimer/roles/teacher/quize/quiz_controller.dart';

import 'package:get/get.dart';

class QuizBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(() => QuizController());
  }
}
