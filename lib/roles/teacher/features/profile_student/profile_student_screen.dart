import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/beauti/beauti_components.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flumuttslimer/roles/teacher/my_group/my_group_controller.dart';
import 'package:flumuttslimer/roles/teacher/my_group/widgets/my_group_components.dart';
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
        body: Container(
      height: 40.h,
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
      child: Padding(
        padding: EdgeInsets.all(35),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start, // توجيه العمود نحو الأسفل
          crossAxisAlignment:
              CrossAxisAlignment.center, // توجيه العناصر نحو اليمين
          children: [
            Container(
              height: 70.sp,
              width: 70.sp,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.purble4),
            ),
            Text(
              data['name_student']!,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 15.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' المستوى 5 ',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 10.0.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        'عام ${data['age']!}',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 10.0.sp,
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
                          fontSize: 10.0.sp,
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
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                data['points']!,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 10.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
