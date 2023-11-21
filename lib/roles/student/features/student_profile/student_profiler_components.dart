import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/student_profile/student_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ImageSelecter extends StatelessWidget {
  ImageSelecter({
    super.key,
    this.color,
  });
  final color;
  var data = Get.parameters;
  final _controller = Get.find<StudentProfileController>();

  @override
  Widget build(BuildContext context) {
    print(_controller.name);
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: white,
        child: Center(
            child: Text(
          _controller.name,
          style: TextStyle(
              color: color,
              fontSize: 100.sp,
              fontWeight: FontWeight.bold,
              fontFamily: bj),
        )),
      ),
    );
  }
}
