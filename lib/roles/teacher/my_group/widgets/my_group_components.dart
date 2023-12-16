import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class info_group extends StatelessWidget {
  const info_group({
    super.key,
    required this.data,
  });

  final Map<String, String?> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: Get.size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.purble2, AppColors.purble3],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.sp),
          bottomRight: Radius.circular(10.sp),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start, // توجيه العمود نحو الأسفل
          crossAxisAlignment:
              CrossAxisAlignment.end, // توجيه العناصر نحو اليمين
          children: [
            Text(
              data['name_group']!,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.bj,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              'الفئة العمرية : ${data['categ']!}',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.bj),
            ),
            SizedBox(height: 3.h),
            Text(
              data['name_institute']!,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.bj),
            ),
          ],
        ),
      ),
    );
  }
}
