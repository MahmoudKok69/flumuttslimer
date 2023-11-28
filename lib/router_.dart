import 'package:flumuttslimer/roles/student/bindings/azkar_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/beuati_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/groups_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/home_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/login_bindings.dart';
import 'package:flumuttslimer/roles/student/bindings/news_bindings.dart';
import 'package:flumuttslimer/roles/student/bindings/prizes_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/quran_Binding.dart';
import 'package:flumuttslimer/roles/student/bindings/rank_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/refrences_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/register_bindings.dart';
import 'package:flumuttslimer/roles/student/bindings/student_profile_binding.dart';
import 'package:flumuttslimer/roles/student/bindings/student_quizes_binding.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/Azkar_detail_screen.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_screen.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_screen.dart';
import 'package:flumuttslimer/roles/student/features/Quran/sourah-screen.dart';
import 'package:flumuttslimer/roles/student/features/auth/login/login_screen.dart';
import 'package:flumuttslimer/roles/student/features/auth/register/register_screen.dart';
import 'package:flumuttslimer/roles/student/features/beauti/beuati_screen.dart';
import 'package:flumuttslimer/roles/student/features/groups/groups_screen.dart';
import 'package:flumuttslimer/roles/student/features/hamsat/hamsat_screen.dart';
import 'package:flumuttslimer/roles/student/features/home/home_screen.dart';
import 'package:flumuttslimer/roles/student/features/news/news_screen.dart';
import 'package:flumuttslimer/roles/student/features/onboarding/onboarding_screen.dart';
import 'package:flumuttslimer/roles/student/features/prizes/prizes_screen.dart';
import 'package:flumuttslimer/roles/student/features/quizes/screens/quiz_start_screen.dart';
import 'package:flumuttslimer/roles/student/features/quizes/screens/student_quizes_screen.dart';
import 'package:flumuttslimer/roles/student/features/rank/rank_screen.dart';
import 'package:flumuttslimer/roles/student/features/refrences/refrences_screen.dart';
import 'package:flumuttslimer/roles/student/features/student_profile/student_profile_screen.dart';
import 'package:flumuttslimer/roles/teacher/ad/ad_screen.dart';
import 'package:flumuttslimer/roles/teacher/auth/login_teacher/login_teacher_screen.dart';
import 'package:flumuttslimer/roles/teacher/binding_teacher/ad_binding.dart';
import 'package:flumuttslimer/roles/teacher/binding_teacher/add_group_binding.dart';
import 'package:flumuttslimer/roles/teacher/binding_teacher/home_teacher_binding.dart';
import 'package:flumuttslimer/roles/teacher/binding_teacher/login_teacher_binding.dart';
import 'package:flumuttslimer/roles/teacher/binding_teacher/my_group_binding.dart';
import 'package:flumuttslimer/roles/teacher/binding_teacher/profile_student_binding.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/home_teacher_screen.dart';

import 'package:flumuttslimer/roles/teacher/new_upd_group/add_group_screen.dart';
import 'package:flumuttslimer/roles/teacher/my_group/my_group_screen.dart';
import 'package:flumuttslimer/roles/teacher/new_upd_group/update_group_screen.dart';
import 'package:flumuttslimer/roles/teacher/profile_student/profile_student_screen.dart';

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
  static const student_profile = '/studentprofile';
  static const login_teacher = '/loginteacher';
  static const hometeacher = '/hometeacher';
  static const mygroup = '/mygroup';
  static const add_group = '/add_group';
  static const ad = '/ad';
  static const newgroup = '/newgroup';
  static const update_info_group = '/update_info_group';
  static const profile_student = '/profile_student';
  static const tstudent_profile = '/tstudent_profile';
  static const refrences = '/refrences';
  static const sgroup = '/sgroup';
  static const squizes = '/squizes';
  static const squizstart = '/squizstart';

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
      page: () => const AzkarScreen(),
      binding: SAzkarBinding(),
    ),
    GetPage(
      name: sAzkardetail,
      page: () => AzkarDetailScreen(),
    ),
    GetPage(
      name: sQuran,
      page: () => const QuranScreen(),
      binding: SQuranBinding(),
    ),
    GetPage(
      name: beuati,
      page: () => const BeuatiScreen(),
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
      page: () => const HamsatScreen(),
    ),
    GetPage(
      name: sNews,
      page: () => NewsScreen(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: student_profile,
      page: () => StudentProfileScreen(),
      binding: StudentProfileBinding(),
    ),
    GetPage(
      name: login_teacher,
      page: () => const Login_teacherScreen(),
      binding: LoginteacherBinding(),
    ),
    GetPage(
      name: hometeacher,
      page: () => TeacherHomeScreen(),
      binding: HometeacherBinding(),
    ),
    GetPage(
      name: mygroup,
      page: () => TeacherGroupsScreen(),
      binding: MyGroupBinding(),
    ),
    GetPage(
      name: add_group,
      page: () => AddGroupScreen(),
      binding: Add_groupBinding(),
    ),
    GetPage(
      name: ad,
      page: () => AdScreen(),
      binding: AdBinding(),
    ),
    GetPage(
      name: newgroup,
      page: () => AddGroupScreen(),
      binding: Add_groupBinding(),
    ),
    GetPage(
      name: update_info_group,
      page: () => UpdateGroupScreen(),
      binding: Add_groupBinding(),
    ),
    GetPage(
      name: tstudent_profile,
      page: () => TStudentProfileScreen(),
      binding: Profile_studentBinding(),
    ),
    GetPage(
      name: refrences,
      page: () => const RefrencesScreen(),
      binding: RefrencesBinding(),
    ),
    GetPage(
      name: sgroup,
      page: () => const SGroupsScreen(),
      binding: sGroupsBinding(),
    ),
    GetPage(
      name: squizes,
      page: () => const StudentQuizesScreen(),
      binding: StudentQuizesBinding(),
    ),
    GetPage(
      name: squizstart,
      page: () => StudentQuizStartScreen(),
    ),
  ];
}
