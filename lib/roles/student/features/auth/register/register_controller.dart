import 'package:flumuttslimer/roles/student/features/auth/register/models/public_info_model.dart';
import 'package:flumuttslimer/roles/student/features/auth/register/register_services.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _services = RegisterServices();

  String name = '';
  int age = 18;
  bool gender = true;
  String country = 'سوريا';
  String phoneNumber = '096212';
  String email = '';
  String password = '';
  String confirmPassword = '';
  List<String> countries = ['سوريا', "العراق", "اليمن", "السعودية", "مصر"];
  String image = '';
  int selectedAvatatarIndex = -1;
  var selectedImage;
  bool obscure = true;
  bool obscureConfi = true;
  List<String> male_avatars = List.generate(
      11, (index) => 'assets/images/avatars/male_avatars/${index + 1}.png');
  List<String> female_avatars = List.generate(
      12, (index) => 'assets/images/avatars/female_avatars/${index + 1}.png');
  List<String> avatars = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    avatars = male_avatars;
    print(avatars);
  }

  void setName(String value) {
    name = value;
  }

  void setAge(int value) {
    age = value;
    print(age.toString());
    update(['age_field']);
    print(gender);
  }

  void setGender(bool value) {
    gender = value;
    if (value) {
      avatars = male_avatars;
    } else {
      avatars = female_avatars;
    }
    print(avatars);
    update(['gender_field', 'avatar']);
  }

  void setCountry(String value) {
    country = value;
    update(['country_field']);
  }

  void setPhoneNumber(String value) {
    phoneNumber = value;
  }

  void setEmail(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  changeObscure() {
    obscure = !obscure;
    update(['password_filed']);
  }

  changeObscureConfi() {
    obscureConfi = !obscureConfi;
    update(['confiPassword_field']);
  }

  setImage(file) {
    selectedImage = file;
    selectedAvatatarIndex = -1;
    update(['image_select']);
  }

  setAvatar(index) {
    selectedAvatatarIndex = index;
    image = avatars[index];
    update(['avatar']);
  }

  regester() async {
    PublicInfoModel info = PublicInfoModel(
        name: name,
        email: email,
        password: password,
        gender: gender ? 'male' : 'female',
        avatar: 'avatars/user$selectedAvatatarIndex.png',
        address: country,
        phone_number: phoneNumber);
    try {
      return await _services.register(info);
    } catch (e) {}
  }
}
