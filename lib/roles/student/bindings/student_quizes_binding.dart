import 'package:flumuttslimer/roles/student/features/quizes/student_quizes_controller.dart';
import 'package:get/get.dart';

class StudentQuizesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentQuizesController>(() => StudentQuizesController(),
        fenix: true);
  }
}
