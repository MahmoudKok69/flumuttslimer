import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_controller.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';

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

class AzkarBody extends StatelessWidget {
  var _controller = Get.find<AzkarController>();
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        AllAzkar(),
        MyAzkar(),
      ],
    );
  }
}

class AllAzkar extends StatelessWidget {
  AllAzkar({super.key});
  var _controller = Get.find<AzkarController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
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
                        borderRadius: BorderRadius.circular(5.sp)),
                    title: Text(
                      item.name!,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: black,
                        fontFamily: bj,
                        fontSize: 12.sp,
                        decoration:
                            item.isChecked! ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    tileColor: item.isChecked! ? purble3 : purble4,
                    subtitle: Text(
                      '${item.points} نقطة',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: purble1,
                        fontFamily: bj,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: CustomCheckBox(
                      height: 12.sp,
                      width: 12.sp,
                      selectColor: purble2,
                      unselectColor: purble5,
                      iconColor: white,
                      borderRadius: 1.sp,
                      isChecked: item.isChecked,
                      iconSize: 12.sp,
                      onchange: () {
                        _controller.checkAzkar(index);
                      },
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}

class MyAzkar extends StatelessWidget {
  MyAzkar({super.key});
  var _controller = Get.find<AzkarController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  borderRadius: BorderRadius.circular(5.sp)),
              title: Text(
                item.name!,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: black,
                  fontFamily: bj,
                  fontSize: 12.sp,
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
                  fontSize: 8.sp,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }
}
