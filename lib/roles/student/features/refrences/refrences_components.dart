import 'dart:math';

import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/roles/student/features/refrences/refrences_contorller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PdfSection extends StatelessWidget {
  PdfSection({
    super.key,
  });
  var _controller = Get.find<RefrencesController>();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Padding(
        padding: EdgeInsets.only(right: 2.w),
        child: Text(
          'الملفات',
          style: TextStyle(
            color: grey1,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
      ),
      SizedBox(height: 1.2.h),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.only(left: 1.w),
          child: Row(
            children: List.generate(_controller.pdfs.length, (index) {
              var item = _controller.pdfs[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                width: 40.w,
                height: 30.h,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5.sp),
                    border: Border.all(
                      color: grey1,
                      width: 0.25.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: black,
                        blurRadius: 3,
                      )
                    ]),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                  child: Text(
                    item.title!,
                    maxLines: 100,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                )),
              );
            }),
          ),
        ),
      )
    ]);
  }
}

class VideosSection extends StatelessWidget {
  VideosSection({
    super.key,
  });
  var _controller = Get.find<RefrencesController>();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Padding(
        padding: EdgeInsets.only(right: 2.w),
        child: Text(
          'الفيديوهات',
          style: TextStyle(
            color: grey1,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
      ),
      SizedBox(height: 1.2.h),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.only(left: 1.w),
          child: Row(
            children: List.generate(_controller.pdfs.length, (index) {
              var item = _controller.videos[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    width: 60.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(
                          color: grey1,
                          width: 0.25.w,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: black,
                            blurRadius: 3,
                          )
                        ]),
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.w, vertical: 1.h),
                            child: Icon(
                              Icons.play_arrow,
                              size: min(32.w, 14.h) / 2,
                              color: purble3,
                            ))),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 20.h,
                    width: 50.w,
                    child: Text(
                      item.title!,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: grey1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      )
    ]);
  }
}