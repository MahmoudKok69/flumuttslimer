import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flumuttslimer/core/bottom_nagigation_bar/bottom_nav_bar_controller.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_screen.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_screen.dart';
import 'package:flumuttslimer/roles/student/features/home/home_screen.dart';
import 'package:flumuttslimer/roles/student/features/student_profile/student_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: GetBuilder(
        id: 'nav_bar',
        init: BottomNavBarController(),
        builder: (_) {
          return FlashyTabBar(
            selectedIndex: Get.find<BottomNavBarController>().index!,
            showElevation: true,
            onItemSelected: (index) {},
            items: [
              FlashyTabBarItem(
                icon: Icon(Icons.event),
                title: Text('Events'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.highlight),
                title: Text('Highlights'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.settings),
                title: Text('한국어'),
              ),
            ],
          );
        },
      ),
      body: pages[Get.find<BottomNavBarController>().index!],
    );
  }
}
