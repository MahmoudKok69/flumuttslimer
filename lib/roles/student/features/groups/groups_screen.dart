import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/groups/Sgroups_comonents.dart';
import 'package:flumuttslimer/roles/student/features/groups/groups_controller.dart';
import 'package:flumuttslimer/roles/student/features/groups/widgets/join_by_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SGroupsScreen extends StatelessWidget {
  const SGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          text: 'المجموعات العامة',
          leadingIcon: AppIcons.back_icon,
          actionIcon: Icons.search,
          onTapLeadingIcon: () {
            Get.back();
          },
          onTapActionIcon: () {}),
      floatingActionButton: InkWell(
        onTap: () {
          joinGroubByLinkDialog();
        },
        child: Container(
          width: 25.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: AppColors.purble3,
            borderRadius: BorderRadius.circular(5.sp),
          ),
          child: FittedBox(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                child: Row(
                  children: [
                    ArabicText(
                      text: 'رابط',
                      color: AppColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Transform.rotate(
                        angle: 45,
                        child: Icon(
                          Icons.link,
                          color: AppColors.white,
                          size: 20.sp,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 3.h),
        child: SGroupsBody(),
      ),
    );
  }
}
