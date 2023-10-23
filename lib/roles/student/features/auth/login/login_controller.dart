import 'package:get/get.dart';

class LoginController extends GetxController {
  String email = '';
  String password = '';
  bool obscure = true;

  changObscure() {
    obscure = !obscure;
    update(['password_field']);
    print(obscure);
  }

  login() {
    print(email);
    print(password);
  }
}
