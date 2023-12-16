import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/student_profile/student_profile_controller.dart';
import 'package:flumuttslimer/roles/student/features/student_profile/student_profiler_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentProfileScreen extends StatelessWidget {
  StudentProfileScreen({super.key});
  final _controller = Get.find<StudentProfileController>();
  @override
  Widget build(BuildContext context) {
    print(Get.size.width);
    print(Get.size.height);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.changeText();
          },
          backgroundColor: AppColors.purble2,
        ),
        appBar: buildAppBar(
            text: 'بروفايل',
            leadingIcon: Icons.arrow_back_ios_new_rounded,
            actionIcon: null,
            onTapLeadingIcon: () {
              Get.back();
            },
            onTapActionIcon: null),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder(
                id: 'update_text',
                init: StudentProfileController(),
                builder: (_) {
                  return ImageSelecter(color: AppColors.orange1);
                },
              ),
              GetBuilder(
                id: 'update_text2',
                init: StudentProfileController(),
                builder: (_) {
                  return ImageSelecter(
                    color: AppColors.pink,
                  );
                },
              ),
            ],
          ),
        ));
  }
}
