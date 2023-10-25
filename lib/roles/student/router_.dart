import 'package:flumuttslimer/roles/student/bindings/azkar_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/beuati_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/home_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/login_bindings.dart';
import 'package:flumuttslimer/roles/student/bindings/quran_Binding.dart';
import 'package:flumuttslimer/roles/student/bindings/register_bindings.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/Azkar_detail_screen.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_screen.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_screen.dart';
import 'package:flumuttslimer/roles/student/features/auth/login/login_screen.dart';
import 'package:flumuttslimer/roles/student/features/auth/register/register_screen.dart';
import 'package:flumuttslimer/roles/student/features/beauti/beuati_screen.dart';
import 'package:flumuttslimer/roles/student/features/home/home_screen.dart';
import 'package:flumuttslimer/roles/student/features/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();
  /*//? *****************Student********************/
  static const INITIAL = '/onboard';
  static const sLogin = '/login';
  static const sregister = '/register';
  static const shome = '/shome';
  static const sAzkar = '/sazkar';
  static const sAzkardetail = '/sazkardetail';
  static const sQuran = '/squran';
  static const beuati = '/beuati';
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
    GetPage(
      name: shome,
      page: () => SHomeScreen(),
      binding: SHomeBinding(),
    ),
    GetPage(
      name: sAzkar,
      page: () => AzkarScreen(),
      binding: SAzkarBinding(),
    ),
    GetPage(
      name: sAzkardetail,
      page: () => AzkarDetailScreen(),
    ),
    GetPage(
      name: sQuran,
      page: () => QuranScreen(),
      binding: SQuranBinding(),
    ),
    GetPage(
      name: beuati,
      page: () => BeuatiScreen(),
      binding: BeuatiBinding(),
    ),
  ];
}
