import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/prizes/prizes_components.dart';
import 'package:flumuttslimer/roles/student/features/prizes/prizes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PrizesScreen extends StatelessWidget {
  PrizesScreen({super.key});
  final _controller = Get.find<PrizesController>();

  @override
  Widget build(BuildContext context) {
    var myPrizes = _controller.getMyPrizes();
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(appBar: _buildAppBar(), body: PrizesBody()),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.purble2,
      title: Center(
        child: Text(
          'الجوائز',
          style: TextStyle(
            fontSize: 16.sp,
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
          size: 12.sp,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      bottom: TabBar(
          indicatorColor: AppColors.purble1,
          automaticIndicatorColorAdjustment: false,
          overlayColor: MaterialStateProperty.all(AppColors.purble3),
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.orange2,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Text(
              'جوائزي',
              style: TextStyle(
                  color: AppColors.white,
                  fontFamily: AppFonts.bj,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
            ),
            Text(
              'الجوائز',
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
