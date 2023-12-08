import 'package:flumuttslimer/roles/student/features/quizes/models/question_model.dart';
import 'package:flumuttslimer/roles/teacher/home_teacher/models/GroupesTeachModel.dart';
import 'package:flumuttslimer/roles/teacher/quize/models/Add_QuizModel.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  String name_quiz = ' الإختبار ';

  void setname_quiz(String value) {
    name_quiz = value;
    update(['update_name_quiz']);
    print(name_quiz);
  }

  var List_Questions = [];

  void addToQuestionList(AddQuizModel addQuizModel) {
    List_Questions.add(addQuizModel.toJson());
    print(List_Questions);
  }

////////*************************************///////////////////////// */
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

  void addQuiz() {}
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
