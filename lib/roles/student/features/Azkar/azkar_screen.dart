import 'dart:math';

import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_controller.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AzkarScreen extends StatelessWidget {
  var _controller = Get.find<AzkarController>();
  AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: purble2,
          title: Center(
            child: Text(
              'الأذكار',
              style: TextStyle(
                fontSize: 25.sp,
                fontFamily: bj,
                fontWeight: FontWeight.w500,
                color: white,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: white,
              size: 20.sp,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: white,
                  size: 20.sp,
                ))
          ],
          bottom: TabBar(
              indicatorColor: purble1,
              automaticIndicatorColorAdjustment: false,
              overlayColor: MaterialStateProperty.all(purble3),
              labelColor: white,
              unselectedLabelColor: orange2,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Text(
                  'أذكاري',
                  style: TextStyle(
                      color: white,
                      fontFamily: bj,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp),
                ),
                Text(
                  'الأذكار',
                  style: TextStyle(
                    color: white,
                    fontFamily: bj,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(5.sp),
              child: ListView.builder(
                itemCount: _controller.azkary.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = _controller.azkary[index];
                  return Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: GetBuilder<AzkarController>(
                        id: 'azkary_tile',
                        init: AzkarController(),
                        builder: (_) {
                          return ListTile(
                            onTap: () {
                              Get.toNamed(AppPages.sAzkardetail, parameters: {
                                'name': item.name!,
                                'content': item.descirbe!,
                                'time': 'الصباح'
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp)),
                            title: Text(
                              item.name!,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: black,
                                fontFamily: bj,
                                fontSize: 20.sp,
                                decoration: item.isChecked!
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            tileColor: item.isChecked! ? purble3 : purble4,
                            subtitle: Text(
                              item.points.toString(),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: purble1,
                                fontFamily: bj,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: CustomCheckBox(
                              height: 20.sp,
                              width: 20.sp,
                              selectColor: purble2,
                              unselectColor: purble5,
                              iconColor: white,
                              borderRadius: 4.sp,
                              isChecked: item.isChecked,
                              iconSize: 20.sp,
                              onchange: () {
                                _controller.checkAzkar(index);
                              },
                            ),
                          );
                        },
                      ));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.sp),
              child: ListView.builder(
                itemCount: _controller.azkar.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = _controller.azkar[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(AppPages.sAzkardetail, parameters: {
                          'name': item.name!,
                          'content': item.descirbe!,
                          'time': 'الصباح'
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp)),
                      title: Text(
                        item.name!,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: black,
                          fontFamily: bj,
                          fontSize: 20.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      tileColor: purble4,
                      subtitle: Text(
                        item.descirbe!,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: black,
                          fontFamily: bj,
                          fontSize: 12.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox(
      {super.key,
      this.height,
      this.iconColor,
      this.isChecked,
      this.selectColor,
      this.unselectColor,
      this.width,
      this.borderRadius,
      this.iconSize,
      this.onchange});
  Color? selectColor;
  Color? unselectColor;
  bool? isChecked = false;
  Color? iconColor;
  double? width;
  double? height;
  double? borderRadius;
  double? iconSize;
  final onchange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onchange,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isChecked! ? selectColor : unselectColor,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Center(
          child: isChecked!
              ? Icon(
                  Icons.check,
                  color: iconColor,
                  size: iconSize,
                )
              : null,
        ),
      ),
    );
  }
}
