import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/quizes/widgets/quizes_gridView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StudentQuizesScreen extends StatelessWidget {
  const StudentQuizesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          text: 'الأختبارات',
          leadingIcon: AppIcons.back_icon,
          actionIcon: AppIcons.search_icon,
          onTapLeadingIcon: () {
            Get.back();
          },
          onTapActionIcon: () {}),
      body: QuizesGridView(),
    );
  }
}
