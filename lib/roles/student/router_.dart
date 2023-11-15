import 'package:flumuttslimer/roles/student/bindings/azkar_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/beuati_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/home_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/login_bindings.dart';
import 'package:flumuttslimer/roles/student/bindings/news_bindings.dart';
import 'package:flumuttslimer/roles/student/bindings/prizes_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/quran_Binding.dart';
import 'package:flumuttslimer/roles/student/bindings/rank_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/register_bindings.dart';
import 'package:flumuttslimer/roles/student/bindings/student_profile_binding.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/Azkar_detail_screen.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_screen.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_screen.dart';
import 'package:flumuttslimer/roles/student/features/Quran/sourah-screen.dart';
import 'package:flumuttslimer/roles/student/features/auth/login/login_screen.dart';
import 'package:flumuttslimer/roles/student/features/auth/register/register_screen.dart';
import 'package:flumuttslimer/roles/student/features/beauti/beuati_screen.dart';
import 'package:flumuttslimer/roles/student/features/hamsat/hamsat_screen.dart';
import 'package:flumuttslimer/roles/student/features/home/home_screen.dart';
import 'package:flumuttslimer/roles/student/features/news/news_screen.dart';
import 'package:flumuttslimer/roles/student/features/onboarding/onboarding_screen.dart';
import 'package:flumuttslimer/roles/student/features/prizes/prizes_screen.dart';
import 'package:flumuttslimer/roles/student/features/rank/rank_screen.dart';
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
  static const rank = '/rank';
  static const sorah = '/sorah';
  static const prizes = '/prizes';
  static const hamsa = '/hamsa';
  static const sNews = '/snews';

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
    GetPage(
      name: rank,
      page: () => RankScreen(),
      binding: RankBinding(),
    ),
    GetPage(
      name: sorah,
      page: () => SorahScreen(),
    ),
    GetPage(
      name: prizes,
      page: () => PrizesScreen(),
      binding: PrizesBinding(),
    ),
    GetPage(
      name: hamsa,
      page: () => HamsatScreen(),
    ),
    GetPage(
      name: sNews,
      page: () => NewsScreen(),
      binding: NewsBinding(),
    ),
  ];
}
