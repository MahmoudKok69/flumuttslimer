import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_components.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_controller.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: _buildAppBar(),
          floatingActionButton: InkWell(
            onTap: () {
              Get.find<QuranController>().onInit();
              Get.toNamed(AppPages.sorah);
            },
            child: Container(
              width: 32.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: purble3,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Center(
                    child: Text(
                  'متابعة القراءة',
                  maxLines: 1,
                  style: TextStyle(
                      color: white,
                      fontFamily: bj,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp),
                )),
              ),
            ),
          ),
          body: QuranBody()),
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
          AppIcons.back_icon,
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
