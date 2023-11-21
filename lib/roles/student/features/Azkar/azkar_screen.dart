import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/Azkar_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: purble2,
      title: Center(
        child: Text(
          'الأذكار',
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: bj,
            fontWeight: FontWeight.w500,
            color: white,
          ),
        ),
      ),
      leading: IconButton(
        icon: Icon(
          AppIcons.back_icon,
          color: white,
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
              color: white,
              size: 16.sp,
            ))
      ],
      bottom: TabBar(
          indicatorColor: purble1,
          automaticIndicatorColorAdjustment: false,
          overlayColor: MaterialStateProperty.all(purble3),
          labelColor: white,
          unselectedLabelColor: orange2,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Text(
              'أذكاري',
              style: TextStyle(
                  color: white,
                  fontFamily: bj,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
            ),
            Text(
              'الأذكار',
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
