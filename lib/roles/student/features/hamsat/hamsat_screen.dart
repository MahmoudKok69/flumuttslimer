import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HamsatScreen extends StatelessWidget {
  const HamsatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(
      //     text: 'همسة اليوم',
      //     leadingIcon: Icons.arrow_back_ios_new_rounded,
      //     actionIcon: null,
      //     onTapLeadingIcon: () {
      //       Get.back();
      //     },
      //     onTapActionIcon: null),
      body: Column(
        children: [
          Container(
            width: Get.size.width,
            height: Get.size.height * 0.3,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [purble2, purble3],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.sp),
                    bottomRight: Radius.circular(5.sp))),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: Get.size.width,
                    height: 10.h,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: white,
                          size: 16.sp,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  Text(
                    'همسة اليوم',
                    style: TextStyle(
                      color: white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'اسم الهمسة',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: purble1,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة كتابة',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
