import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/quizes/widgets/quizes_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StudentQuizesScreen extends StatelessWidget {
  const StudentQuizesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(
          text: 'الأختبارات',
          leadingIcon: AppIcons.back_icon,
          actionIcon: AppIcons.search_icon,
          onTapLeadingIcon: () {
            Get.back();
          },
          onTapActionIcon: () {},
          bottom: TabBar(
              indicatorColor: purble1,
              automaticIndicatorColorAdjustment: false,
              overlayColor: MaterialStateProperty.all(purble3),
              labelColor: white,
              unselectedLabelColor: orange2,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Text(
                  'الأختبارات',
                  style: TextStyle(
                      color: white,
                      fontFamily: bj,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ),
                Text(
                  'الأختبارات المنجزة',
                  style: TextStyle(
                    color: white,
                    fontFamily: bj,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ),
              ]),
        ),
        body: QuizBody(),
      ),
    );
  }
}
