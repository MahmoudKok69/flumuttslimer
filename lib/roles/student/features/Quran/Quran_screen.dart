import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_components.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_controller.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(appBar: _buildAppBar(), body: QuranBody()),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: purble2,
      title: Center(
        child: Text(
          'القرأن الكريم',
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: bj,
            fontWeight: FontWeight.w400,
            color: white,
          ),
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: white,
          size: 20.sp,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      bottom: TabBar(
          indicatorColor: purble1,
          automaticIndicatorColorAdjustment: false,
          overlayColor: MaterialStateProperty.all(purble3),
          labelColor: white,
          unselectedLabelColor: orange2,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Text(
              'إنجازاتي',
              maxLines: 1,
              style: TextStyle(
                  color: white,
                  fontFamily: bj,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
            ),
            Text(
              'المصحف الشريف',
              maxLines: 1,
              style: TextStyle(
                color: white,
                fontFamily: bj,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
          ]),
    );
  }
}
