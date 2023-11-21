import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/roles/student/features/Quran/models/QuranPos_model.dart';
import 'package:flumuttslimer/roles/student/features/auth/public_info_model.dart';
import 'package:flumuttslimer/roles/student/features/home/home_screen.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupHive();
  setupHiveAdapters();
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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: purble2),
          useMaterial3: true,
        ),
        home: SHomeScreen(),
      ),
    );
  }
}
