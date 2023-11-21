import 'package:flumuttslimer/roles/teacher/Home_teacher/models/GroupesTeachModel.dart';
import 'package:get/get.dart';

class HomeTeacherController extends GetxController {
  bool reciting = false; //تسميع
  bool memorizing = false; //حفظ
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
  // String name_Achievement = '';
  // bool is_selected =true;
  var list_Achievements = [
    (name_Achievement: 'تسميع قرآن كريم', selected: true),
    (name_Achievement: 'حفظ قرآن كريم', selected: true)
  ];
  // select(String The_selected) {
  //   if (The_selected == 'تسميع قرآن كريم') {
  //     reciting = true;
  //   }
  //   if (The_selected == 'حفظ قرآن كريم') {
  //     memorizing = true;
  //   }
  //   print('تسميع : $reciting , حفظ : $memorizing');
  // }
  var selectedAchievement = ''.obs;

  void select(String value) {
    selectedAchievement.value = value;
  }

  int from_the_page = 0;
  int to_the_page = 0;
  void setfrom_the_page(int value) {
    from_the_page = value;
  }

  void setto_the_page(int value) {
    to_the_page = value;
  }

  RxInt selectedStar = 0.obs;

  void selectStar(int star) {
    selectedStar.value = star;
  }

  add_achievement_reciting() {
    print(from_the_page);
    print(to_the_page);
    print(selectedStar);

    print('add_achievement_reciting');
  }

  int selected_part = 1;

  void set_part(int value) {
    selected_part = value;
    print(selected_part.toString());
    update(['selected_part']);
  }

  add_achievement_memorizing() {
    print(selected_part);
    print(selectedStar);
    print('add_achievement_memorizing');
  }
}
