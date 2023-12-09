import 'package:flumuttslimer/roles/teacher/Home_teacher/models/GroupesTeachModel.dart';
import 'package:flumuttslimer/roles/teacher/quize/models/QuizTeachModel.dart';
import 'package:get/get.dart';

class HomeTeacherController extends GetxController {
  var groups = [
    GroupesTeachModel(
        categ: 'يافعين',
        count_students: 15,
        name_institute: 'القمة',
        name_group: 'عباد االرحمن',
        invite_url: '',
        max_members: 0,
        isPrivate: true,
        isAvailable: true),
    GroupesTeachModel(
        categ: 'يافعين',
        count_students: 15,
        name_institute: 'القمة',
        name_group: 'عباد االرحمن',
        invite_url: '',
        max_members: 0,
        isPrivate: false,
        isAvailable: true),
    GroupesTeachModel(
        categ: 'يافعين',
        count_students: 15,
        name_institute: 'القمة',
        name_group: 'عباد االرحمن',
        invite_url: '',
        max_members: 0,
        isPrivate: true,
        isAvailable: true),
    GroupesTeachModel(
        categ: 'يافعين',
        count_students: 15,
        name_institute: 'القمة',
        name_group: 'عباد االرحمن',
        invite_url: '',
        max_members: 0,
        isPrivate: true,
        isAvailable: true),
    GroupesTeachModel(
        categ: 'يافعين',
        count_students: 15,
        name_institute: 'القمة',
        name_group: 'عباد االرحمن',
        invite_url: '',
        max_members: 0,
        isPrivate: true,
        isAvailable: true),
    GroupesTeachModel(
        categ: 'يافعين',
        count_students: 15,
        name_institute: 'القمة',
        name_group: 'عباد االرحمن',
        invite_url: '',
        max_members: 0,
        isPrivate: true,
        isAvailable: true),
  ];
  var quizes = [
    QuizTeachModel(name_quiz: 'عقيدة', count_Questions: 15, count_points: 15),
    QuizTeachModel(name_quiz: 'فقه', count_Questions: 12, count_points: 20),
    QuizTeachModel(name_quiz: 'أخلاق ', count_Questions: 18, count_points: 15),
  ];
}
