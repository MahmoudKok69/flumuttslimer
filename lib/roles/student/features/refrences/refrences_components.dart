import 'dart:math';

import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/refrences/models/refrences_pdfModel.dart';
import 'package:flumuttslimer/roles/student/features/refrences/models/refrences_video.dart';
import 'package:flumuttslimer/roles/student/features/refrences/refrences_contorller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PdfSection extends StatelessWidget {
  PdfSection({
    super.key,
  });
  final _controller = Get.find<RefrencesController>();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Padding(
        padding: EdgeInsets.only(right: 2.w),
        child: Text(
          'الملفات',
          style: TextStyle(
            color: AppColors.grey1,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.bj,
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
              return RefrencesPdfCard(item: item);
            }),
          ),
        ),
      )
    ]);
  }
}

class RefrencesPdfCard extends StatelessWidget {
  const RefrencesPdfCard({
    super.key,
    required this.item,
  });

  final RefrencesPdfModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      width: 40.w,
      height: 30.h,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5.sp),
          border: Border.all(
            color: AppColors.grey1,
            width: 0.25.w,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black,
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
              fontFamily: AppFonts.bj,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp),
        ),
      )),
    );
  }
}

class VideosSection extends StatelessWidget {
  VideosSection({
    super.key,
  });
  final _controller = Get.find<RefrencesController>();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Padding(
        padding: EdgeInsets.only(right: 2.w),
        child: Text(
          'الفيديوهات',
          style: TextStyle(
            color: AppColors.grey1,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.bj,
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
              return RefrencesVideosCard(item: item);
            }),
          ),
        ),
      )
    ]);
  }
}

class RefrencesVideosCard extends StatelessWidget {
  const RefrencesVideosCard({
    super.key,
    required this.item,
  });

  final RefrencesVideoModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          width: 60.w,
          height: 20.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5.sp),
              border: Border.all(
                color: AppColors.grey1,
                width: 0.25.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black,
                  blurRadius: 3,
                )
              ]),
          child: Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                  child: Icon(
                    Icons.play_arrow,
                    size: min(32.w, 14.h) / 2,
                    color: AppColors.purble3,
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
                color: AppColors.grey1,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
