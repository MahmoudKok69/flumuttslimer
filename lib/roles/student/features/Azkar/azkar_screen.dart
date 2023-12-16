import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/Azkar_components.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AzkarScreen extends StatelessWidget {
  AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<AzkarController>(AzkarController());
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: AzkarBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.purble2,
      title: Center(
        child: Text(
          'الأذكار',
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: AppFonts.bj,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
      leading: IconButton(
        icon: Icon(
          AppIcons.back_icon,
          color: AppColors.white,
          size: 16.sp,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AppColors.white,
              size: 16.sp,
            ))
      ],
      bottom: TabBar(
          indicatorColor: AppColors.purble1,
          automaticIndicatorColorAdjustment: false,
          overlayColor: MaterialStateProperty.all(AppColors.purble3),
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.orange2,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Text(
              'أذكاري',
              style: TextStyle(
                  color: AppColors.white,
                  fontFamily: AppFonts.bj,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
            ),
            Text(
              'الأذكار',
              style: TextStyle(
                color: AppColors.white,
                fontFamily: AppFonts.bj,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
          ]),
    );
  }
}
