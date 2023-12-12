import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/bottom_nagigation_bar/bottom_nav_bar_controller.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_screen.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_screen.dart';
import 'package:flumuttslimer/roles/student/features/home/home_screen.dart';
import 'package:flumuttslimer/roles/student/features/student_profile/student_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sizer/sizer.dart';

class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({super.key});

  var pages = [
    SHomeScreen(),
    AzkarScreen(),
    QuranScreen(),
    StudentProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
        id: 'nav_bar',
        init: BottomNavBarController(),
        builder: (_) {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: GetBuilder(
              id: 'nav_bar',
              init: BottomNavBarController(),
              builder: (_) {
                return SalomonBottomBar(
                  itemPadding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  backgroundColor: purble5,
                  currentIndex: Get.find<BottomNavBarController>().index,
                  onTap: (index) {
                    Get.find<BottomNavBarController>().selectIndex(index);
                  },
                  items: [
                    SalomonBottomBarItem(
                      icon: SvgIcon(
                        w: 10.w,
                        h: 5.h,
                        iconTitle: AppIcons.home,
                      ),
                      title: Text('الرئيسية'),
                    ),
                    SalomonBottomBarItem(
                      icon: SvgIcon(w: 10.w, h: 5.h, iconTitle: AppIcons.azkar),
                      title: Text('الأذكار'),
                    ),
                    SalomonBottomBarItem(
                      icon: SvgIcon(w: 10.w, h: 5.h, iconTitle: AppIcons.quran),
                      title: Text('القرأن'),
                    ),
                    SalomonBottomBarItem(
                      icon:
                          SvgIcon(w: 10.w, h: 5.h, iconTitle: AppIcons.profile),
                      title: Text('حسابي'),
                    ),
                  ],
                );
              },
            ),
            body: pages[Get.find<BottomNavBarController>().index!],
          );
        });
  }
}
