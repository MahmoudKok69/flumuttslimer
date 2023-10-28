import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
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
            height: 30.h,
            decoration: BoxDecoration(
                color: purble2,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.sp),
                  bottomRight: Radius.circular(10.sp),
                )),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 20.sp,
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
                      fontSize: 50.sp,
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
                  fontSize: 25.sp,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                data['content']!,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: purble2,
                  fontFamily: bj,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
