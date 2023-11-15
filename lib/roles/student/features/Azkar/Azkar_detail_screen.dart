import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class AzkarDetailScreen extends StatelessWidget {
  AzkarDetailScreen({super.key, this.name, this.time, this.content});
  String? name;
  String? time;
  String? content;
  var data = Get.parameters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 20.h,
            decoration: BoxDecoration(
                color: purble2,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6.sp),
                  bottomRight: Radius.circular(6.sp),
                )),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      child: IconButton(
                        icon: Icon(
                          AppIcons.back_icon,
                          size: 12.sp,
                          color: white,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    data['name']!,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: white,
                      fontFamily: bj,
                      fontSize: 20.sp,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Text(
                data['time']!,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: purble1,
                  fontFamily: bj,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Text(
                  data['content']!,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: purble2,
                    fontFamily: bj,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
