import 'package:flumuttslimer/roles/teacher/Home_teacher/models/GroupesTeachModel.dart';
import 'package:flumuttslimer/roles/teacher/my_group/models/my_group_model.dart';
import 'package:get/get.dart';

class Ad_Controller extends GetxController {
  String text_ad = '';

  var groups = [
    GroupesTeachModel(
      categ: 'يافعين',
      count_students: 15,
      name_institute: 'القمة',
      name_group: 'عباد االرحمن',
    ),
    GroupesTeachModel(
      categ: 'يافعين',
      count_students: 15,
      name_institute: 'القمة',
      name_group: 'عباد االرحمن',
    ),
  ];
  void settextad(String value) {
    text_ad = value;
  }
}
