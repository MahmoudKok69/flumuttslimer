// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:flumuttslimer/roles/student/features/auth/register/models/public_info_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/roles/student/features/Quran/models/QuranPos_model.dart';
import 'package:flumuttslimer/roles/student/features/home/home_screen.dart';
import 'package:flumuttslimer/roles/student/features/onboarding/onboarding_screen.dart';
import 'package:flumuttslimer/roles/teacher/welcome/welcome_controller.dart';
import 'package:flumuttslimer/roles/teacher/welcome/welcomescreen.dart';
import 'package:flumuttslimer/router_.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupHive();
  setupHiveAdapters();
  Get.lazyPut(
    () => WelcomeController(),
  );
  runApp(const MyApp());
}

setupHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

setupHiveAdapters() {
  Hive.registerAdapter(QuranPosModelAdapter());
  Hive.registerAdapter(PublicInfoModelAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // print(Get.size.width);
    // print(Get.size.height);
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: AppPages.shome,
        getPages: AppPages.routes,
        title: 'Muslim Habits',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purble2),
          useMaterial3: true,
        ),
        home: OnBoardingScreen(),
      ),
    );
  }
}
