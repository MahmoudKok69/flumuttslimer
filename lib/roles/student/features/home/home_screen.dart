import 'dart:math';

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/app_image.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/extension.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_controller.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_screen.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_screen.dart';
import 'package:flumuttslimer/roles/student/features/home/home_controller.dart';
import 'package:flumuttslimer/roles/student/features/home/home_model/main_pages.dart';
import 'package:flumuttslimer/roles/student/features/home/widgets/home_cards.dart';
import 'package:flumuttslimer/roles/student/features/prizes/prizes_screen.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SHomeScreen extends StatelessWidget {
  SHomeScreen({super.key});
  var home = [
    // MainPages(
    //     name: 'القرأن',
    //     image: 'assets/images/home/Quran.png',
    //     page: AppPages.sQuran),
    // MainPages(
    //     name: 'الأذكار',
    //     image: 'assets/images/home/Azkar.png',
    //     page: AppPages.sAzkar),
    MainPages(
        name: 'الأخلاق و الجمال',
        image: 'assets/images/home/beuati.png',
        page: AppPages.beuati),
    MainPages(
        name: 'مركزي',
        image: 'assets/images/home/rank.png',
        page: AppPages.rank),
    MainPages(
        name: 'الجوائز',
        image: 'assets/images/home/prize.png',
        page: AppPages.prizes),
    MainPages(
        name: 'الجوائز',
        image: 'assets/images/home/prize.png',
        page: AppPages.hometeacher),
    MainPages(
      name: 'همسة',
      image: 'assets/images/home/hamsa.png',
      page: AppPages.hamsa,
    ),
    MainPages(
      name: 'المكتبة',
      image: 'assets/images/home/refrences.png',
      page: AppPages.refrences,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purble2,
        title: Center(
          child: Text(
            'الواجهة الرئيسية ',
            style: TextStyle(
              color: AppColors.white,
              fontFamily: AppFonts.bj,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leadingWidth: 12.w,
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(AppPages.sNews);
          },
          child: SvgIcon(
            iconTitle: AppIcons.notifications,
            w: 5.w,
            h: 5.h,
          ).pOnly(left: 2.w),
        ),
        automaticallyImplyLeading: false,
        actionsIconTheme: IconThemeData(color: AppColors.white),
      ),
      endDrawer: SizedBox(
        width: 70.w,
        child: _homeDrawer(),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeCards(),
                SizedBox(
                  height: SizerUtil.height * 0.75,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.sp,
                      crossAxisSpacing: 10.sp,
                    ),
                    itemCount: home.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          // color: AppColors.purble2,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(home[index].page!);
                          },
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage(home[index].image!),
                                            fit: BoxFit.contain)),
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Expanded(
                                  child: FittedBox(
                                    child: Text(
                                      home[index].name!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.purble1,
                                          fontSize: 20.sp,
                                          fontFamily: AppFonts.bj,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      );
                    },
                  ).pOnly(bottom: 2.h),
                ),
              ],
            ).pOnly(bottom: 5.h),
          ),
        ),
      ),
    );
  }

  Drawer _homeDrawer() {
    return Drawer(
        backgroundColor: AppColors.white,
        child: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppPages.tstudent_profile, parameters: {
                    'path_image': 'assets/images/avatars/male_avatars/2.png',
                    'name_student': 'kok',
                    'age': '15',
                    'points': '500',
                    'country': 'kok',
                  });
                },
                child: CircleAvatar(
                    radius:
                        min(Get.size.width * 0.4, Get.size.height * 0.4) / 2,
                    backgroundColor: AppColors.white,
                    child: SvgIcon(iconTitle: AppIcons.profile)),
              ),
              SizedBox(
                height: 1.h,
              ),
              drawerOption(
                  'الأنضمام لمجموعة',
                  SizedBox(
                      width:
                          min(Get.size.width * 0.15, Get.size.height * 0.15) /
                              2,
                      height:
                          min(Get.size.width * 0.15, Get.size.height * 0.15) /
                              2,
                      child: Image.asset('assets/images/home/group.png')),
                  AppPages.sgroup),
              drawerOption(
                  "تسجيل الخروج",
                  Icon(
                    Icons.output_rounded,
                    size:
                        min(Get.size.width * 0.15, Get.size.height * 0.15) / 2,
                  ),
                  'page'),
            ],
          ),
        ));
  }
}

drawerOption(String name, Widget icon, String page) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(page);
    },
    child: Column(
      children: [
        Divider(
          thickness: 1.sp,
        ),
        SizedBox(
          height: 2.h,
        ),
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon,
              SizedBox(
                width: 2.w,
              ),
              Text(
                name,
                style: TextStyle(
                  color: AppColors.purble1,
                  fontFamily: AppFonts.bj,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});
  var pages = [
    SHomeScreen(),
    AzkarScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.purble2,
          title: Center(
            child: Text(
              'الواجهة الرئيسية ',
              style: TextStyle(
                color: AppColors.white,
                fontFamily: AppFonts.bj,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.notifications),
            iconSize: 16.sp,
            color: AppColors.white,
            onPressed: () {
              Get.toNamed(AppPages.sNews);
            },
          ),
          actionsIconTheme: IconThemeData(color: AppColors.white),
          automaticallyImplyLeading: false,
        ),
        endDrawer: SizedBox(
          width: 70.w,
          child: Drawer(),
        ),
        body: GetBuilder(
            id: 'nav_bar',
            init: HomeController(),
            builder: (_) {
              return IndexedStack(
                index: Get.find<HomeController>().index,
                children: pages,
              );
            }));
  }
}
