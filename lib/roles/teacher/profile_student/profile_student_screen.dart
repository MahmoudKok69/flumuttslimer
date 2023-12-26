import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/extension.dart';
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
        // appBar: AppBar(
        //   backgroundColor: AppColors.purble2,
        //   automaticallyImplyLeading: true,
        //   leading: IconButton(
        //     icon: Icon(
        //       AppIcons.back_icon,
        //       color: AppColors.white,
        //     ),
        //     onPressed: () {
        //       Get.back();
        //     },
        //   ),
        // ),
        body: Stack(
      children: [
        Container(
          height: 50.h,
          width: Get.size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.purble2, AppColors.purblegradient],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.sp),
              bottomRight: Radius.circular(10.sp),
            ),
          ),
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.start, // توجيه العمود نحو الأسفل
                crossAxisAlignment:
                    CrossAxisAlignment.center, // توجيه العناصر نحو اليمين
                children: [
                  Container(
                    height: 100.sp,
                    width: 100.sp,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.purble4,
                        image: DecorationImage(
                            image: AssetImage(data['path_image']!))),
                  ),
                  Text(
                    data['name_student']!,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' المستوى 5 ',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_sharp,
                            color: AppColors.orange1,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            'عام ${data['age']!}',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 10.0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ).rightDirction(),
                      SizedBox(
                        width: 40.w,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: AppColors.orange1,
                          ),
                          Text(
                            data['country']!,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 10.0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ).rightDirction(),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['points']!,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 10.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ).pSymmetric(horizontal: 1.w),
                        Text(
                          'نقطة',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 10.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ).rightDirction(),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                AppIcons.back_icon,
                color: AppColors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
      ],
    ));
  }
}
