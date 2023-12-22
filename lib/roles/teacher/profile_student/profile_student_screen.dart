import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/extension.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/teacher/profile_student/profile_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TStudentProfileScreen extends StatelessWidget {
  TStudentProfileScreen(
      {super.key,
      this.path_image,
      this.name_student,
      this.age,
      this.points,
      this.country});
  String? path_image;
  String? name_student;
  int? age;
  double? points;
  String? country;
  var data = Get.parameters;
  final _controller = Get.find<TStudentsProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        header_profile(data: data),
        list_information(controller: _controller)
      ],
    ));
  }
}

class list_information extends StatelessWidget {
  const list_information({
    super.key,
    required TStudentsProfileController controller,
  }) : _controller = controller;

  final TStudentsProfileController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              Icon(Icons.male, size: 18.sp),
              SizedBox(width: 2.w),
              ArabicText(text: 'ذكر'),
            ],
          ).rightDirction(),
          Divider(
            color: Colors.grey[400],
            height: 1,
            thickness: 1,
            indent: 8,
            endIndent: 8,
          ),
          Row(
            children: [
              Icon(Icons.email, size: 18.sp),
              SizedBox(width: 2.w),
              ArabicText(text: 'svdvds@gmail.com'),
            ],
          ).rightDirction(),
          Divider(
            color: Colors.grey[400],
            height: 1,
            thickness: 1,
            indent: 8,
            endIndent: 8,
          ),
          Row(
            children: [
              Icon(Icons.lock, size: 18.sp),
              SizedBox(width: 2.w),
              Obx(
                () => ArabicText(
                  text:
                      _controller.isTextVisible.value ? 'S54sx557' : '********',
                ),
              ),
              SizedBox(width: 35.w),
              Obx(
                () => IconButton(
                  icon: Icon(
                    _controller.isTextVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 18.sp,
                  ),
                  onPressed: () {
                    _controller.toggleTextVisibility();
                  },
                ),
              ),
            ],
          ).rightDirction(),
          Divider(
            color: Colors.grey[400],
            height: 1,
            thickness: 1,
            indent: 8,
            endIndent: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                size: 18.sp,
              ),
              SizedBox(width: 2.w),
              ArabicText(text: '09555555555'),
            ],
          ).rightDirction(),
          Divider(
            color: Colors.grey[400],
            height: 1,
            thickness: 1,
            indent: 8,
            endIndent: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 18.sp,
              ),
              SizedBox(width: 2.w),
              ArabicText(text: 'دمشق'),
            ],
          ).rightDirction(),
        ],
      ),
    );
  }
}

class header_profile extends StatelessWidget {
  const header_profile({
    super.key,
    required this.data,
  });

  final Map<String, String?> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: Get.size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.purble3, AppColors.purble4],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.sp),
          bottomRight: Radius.circular(10.sp),
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start, // توجيه العمود نحو الأسفل
        crossAxisAlignment:
            CrossAxisAlignment.center, // توجيه العناصر نحو اليمين
        children: [
          IconBack(),
          Container(
            height: 70.sp,
            width: 70.sp,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.purble4),
          ),
          ArabicText(
            text: data['name_student']!,
            fontSize: 14.sp,
          ),
          Text(
            ' المستوى 5 ',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 9.0.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0.sp, left: 20.0.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        'عام ${data['age']!}',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 9.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.date_range_sharp,
                        color: AppColors.purble3,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        data['country']!,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 9.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.location_on_rounded,
                        color: AppColors.purble3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          RichText(
              text: TextSpan(children: [
            const WidgetSpan(child: PointIcon()),
            TextSpan(
                text: " ${data['points']!}",
                // maxLine: 5,
                style: TextStyle(
                    color: grey1,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    fontFamily: bj)),
          ])),
          // Center(
          //   child: Text(
          //     data['points']!,
          //     style: TextStyle(
          //       color: AppColors.black,
          //       fontSize: 10.0.sp,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class IconBack extends StatelessWidget {
  const IconBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.white,
          size: 12.sp,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
