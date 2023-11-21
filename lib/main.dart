import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flumuttslimer/roles/teacher/home_teacher/home_teacher_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: purble2),
          useMaterial3: true,
        ),
        home: Home_teacher(),
      ),
    );
  }
}
