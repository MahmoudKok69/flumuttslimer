import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/groups/Sgroups_comonents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SGroupsScreen extends StatelessWidget {
  SGroupsScreen({super.key});

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
      body: Padding(
        padding: EdgeInsets.only(top: 3.h),
        child: SGroupsBody(),
      ),
    );
  }
}
