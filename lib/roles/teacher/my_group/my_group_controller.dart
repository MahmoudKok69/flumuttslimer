import 'package:flumuttslimer/roles/teacher/my_group/models/my_group_model.dart';
import 'package:get/get.dart';

class TeacherGroupsController extends GetxController {
  var List_student = [
    MyGroupModel(
        path_image: 'akcskascnlk/,kanvkl/asck',
        name_student: 'ميدو',
        age: 15,
        points: 150.2,
        country: 'سوريا'),
    MyGroupModel(
        path_image: 'akcskascnlk/,kanvkl/asck',
        name_student: 'ميدو',
        age: 15,
        points: 150.2,
        country: 'سوريا'),
    MyGroupModel(
        path_image: 'akcskascnlk/,kanvkl/asck',
        name_student: 'ميدو',
        age: 15,
        points: 150.2,
        country: 'سوريا'),
    MyGroupModel(
        path_image: 'akcskascnlk/,kanvkl/asck',
        name_student: 'ميدو',
        age: 15,
        points: 150.2,
        country: 'سوريا'),
  ];
  bool reciting = false; //تسميع
  bool memorizing = false; //حفظ

  var list_Achievements = [
    (name_Achievement: 'تسميع قرآن كريم', selected: true),
    (name_Achievement: 'حفظ قرآن كريم', selected: true)
  ];
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
