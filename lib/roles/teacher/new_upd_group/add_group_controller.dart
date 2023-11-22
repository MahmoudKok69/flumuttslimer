import 'package:get/get.dart';

class AddGroupController extends GetxController {
  String name_group = '';
  String description = '';
  int max_members = 0;
  bool isPrivate = true;
  bool isAvailable = true;
  void setname(String value) {
    name_group = value;
  }

  void setdescription(String value) {
    description = value;
  }

  void setmax_members(int value) {
    max_members = value;
    print(max_members);
  }

  void setisPrivate(bool value) {
    isPrivate = value;
    update(['isPrivate_field']);
  }

  void setisAvailable(bool value) {
    isAvailable = value;
    update(['isAvailable_field']);
  }

  add_gruop() {}
  update_info_group() {}

  new_url() {}
}
