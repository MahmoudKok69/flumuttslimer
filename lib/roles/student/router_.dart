import 'package:flumuttslimer/roles/student/bindings/login_bindings.dart';
import 'package:flumuttslimer/roles/student/bindings/register_bindings.dart';
import 'package:flumuttslimer/roles/student/features/auth/login/login_screen.dart';
import 'package:flumuttslimer/roles/student/features/auth/register/register_screen.dart';
import 'package:flumuttslimer/roles/student/features/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();
  /*//? *****************Student********************/
  static const INITIAL = '/onboard';
  static const sLogin = '/login';
  static const sregister = '/register';
  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: sLogin,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: sregister,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
  ];
}
