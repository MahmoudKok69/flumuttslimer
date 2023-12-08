import 'package:get/get.dart';

class RegisterController extends GetxController {
  String name = '';
  int age = 18; // Default age
  bool gender = true; // Default gender
  String country = 'سوريا'; // Default country
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
  void setName(String value) {
    name = value;
  }

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

  regester() {
    print(name);
    if (gender) {
      print('Male');
    } else {
      print('Female');
    }
    print(age.toString());
    print(country);
    print(phoneNumber.toString());
    print(email);
    print(password);
    print(confirmPassword);
  }
}
