import 'package:flumuttslimer/roles/teacher/my_group/models/my_group_model.dart';
import 'package:get/get.dart';

class TStudentsProfileController extends GetxController {
  RxBool isTextVisible = false.obs;

  void toggleTextVisibility() {
    isTextVisible.toggle();
  }

  var List_student = [
    MyGroupModel(
        path_image: 'akcskascnlk/,kanvkl/asck',
        name_student: 'ميدو',
        age: 15,
        points: 150.2),
  ];
}
