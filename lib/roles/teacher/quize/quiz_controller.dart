import 'package:flumuttslimer/roles/teacher/home_teacher/models/GroupesTeachModel.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  bool? ischecked_all = false;
  var groups = [
    GroupesTeachModel(
        categ: 'يافعين',
        count_students: 15,
        name_institute: 'القمة',
        name_group: 'عباد االرحمن',
        invite_url: '',
        max_members: 0,
        isPrivate: true,
        isAvailable: true,
        isChecked: false),
    GroupesTeachModel(
        categ: 'يافعين',
        count_students: 15,
        name_institute: 'الهمة',
        name_group: 'عباد االرحمن',
        invite_url: '',
        max_members: 0,
        isPrivate: true,
        isAvailable: true,
        isChecked: false),
    GroupesTeachModel(
        categ: 'يافعين',
        count_students: 15,
        name_institute: 'السلمة',
        name_group: 'عباد االرحمن',
        invite_url: '',
        max_members: 0,
        isPrivate: true,
        isAvailable: true,
        isChecked: false),
  ];

  group_check(int index) {
    groups[index].isChecked = !groups[index].isChecked!;
    update(['group_check']);
  }

  void checked_all_groups() {
    ischecked_all = !ischecked_all!;
    if (ischecked_all == true) {
      groups.forEach((group) {
        group.isChecked = true;
      });
    }
    if (ischecked_all == false) {
      groups.forEach((group) {
        group.isChecked = false;
      });
    }

    update(['group_check']);
    update(['checked_all_groups']);
  }
}
