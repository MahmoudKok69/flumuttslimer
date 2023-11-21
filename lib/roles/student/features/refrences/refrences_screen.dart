import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/refrences/refrences_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RefrencesScreen extends StatelessWidget {
  const RefrencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          text: 'المكتبة',
          leadingIcon: AppIcons.back_icon,
          actionIcon: null,
          onTapLeadingIcon: () {
            Get.back();
          },
          onTapActionIcon: null),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 3.h),
            PdfSection(),
            SizedBox(height: 10.h),
            VideosSection(),
          ],
        ),
      ),
    );
  }
}
