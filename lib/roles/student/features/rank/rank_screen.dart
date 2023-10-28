import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/features/rank/rank_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RankScreen extends StatelessWidget {
  RankScreen({super.key});

  final _controller = Get.find<RankController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [purble2, purble3],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.sp),
                bottomRight: Radius.circular(10.sp),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: white,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      const CustomSwitcher(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 58.h,
                  width: Get.size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.loose,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 50.h,
                          width: 40.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  'assets/images/gifs/crown.gif',
                                  fit: BoxFit.cover,
                                  width: 35.w,
                                  height: 12.h,
                                ),
                              ),
                              Text(
                                _controller.firstThree[0].name!,
                                style: TextStyle(
                                  color: white,
                                  fontFamily: bj,
                                  fontSize: 25.sp,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GetBuilder<RankController>(
                                        init: RankController(),
                                        id: 'circle',
                                        builder: (_) {
                                          return AnimatedBuilder(
                                            animation: _controller
                                                .animationController!,
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return Container(
                                                width: 60.w,
                                                height: 20.h,
                                                decoration: BoxDecoration(
                                                    color: white,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: _controller
                                                            .colorAnimation!
                                                            .value!,
                                                        width: 2.sp)),
                                              );
                                            },
                                          );
                                        }),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: 12.w,
                                        height: 6.h,
                                        decoration: BoxDecoration(
                                            color: white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.green.shade500,
                                              width: 3.sp,
                                              strokeAlign:
                                                  BorderSide.strokeAlignOutside,
                                            )),
                                        child: Center(
                                            child: Text(
                                          '1',
                                          style: TextStyle(
                                              color: purble2, fontSize: 22.sp),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                _controller.firstThree[0].points.toString(),
                                style: TextStyle(
                                  color: white,
                                  fontFamily: bj,
                                  fontSize: 25.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0.sp),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 30.h,
                            width: 20.w,
                            child: Column(
                              children: [
                                Text(
                                  _controller.firstThree[1].name!,
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: bj,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 14.h,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 35.w,
                                        height: 12.h,
                                        decoration: BoxDecoration(
                                          color: white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          width: 8.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                              color: white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.green.shade500,
                                                width: 3.sp,
                                                strokeAlign: BorderSide
                                                    .strokeAlignOutside,
                                              )),
                                          child: Center(
                                              child: Text(
                                            '2',
                                            style: TextStyle(
                                                color: purble2,
                                                fontSize: 16.sp),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  _controller.firstThree[1].points.toString(),
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: bj,
                                    fontSize: 25.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            height: 30.h,
                            width: 20.w,
                            child: Column(
                              children: [
                                Text(
                                  _controller.firstThree[2].name!,
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: bj,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 14.h,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 35.w,
                                        height: 12.h,
                                        decoration: BoxDecoration(
                                          color: white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          width: 8.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                              color: white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.green.shade500,
                                                width: 3.sp,
                                                strokeAlign: BorderSide
                                                    .strokeAlignOutside,
                                              )),
                                          child: Center(
                                              child: Text(
                                            '3',
                                            style: TextStyle(
                                                color: purble2,
                                                fontSize: 16.sp),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  _controller.firstThree[2].points.toString(),
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: bj,
                                    fontSize: 25.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSwitcher extends StatefulWidget {
  const CustomSwitcher({super.key});

  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher> {
  var isEnable = false;
  final animationDuration = const Duration(milliseconds: 200);
  var _alignmentController;
  final _alignments = [
    Alignment.centerLeft,
    Alignment.centerRight,
  ];
  var alignIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 5.h,
      width: 18.w,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: white, width: 1.sp),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400, spreadRadius: 2, blurRadius: 10)
          ]),
      duration: animationDuration,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.sp),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: _alignments[alignIndex],
              duration: animationDuration,
              child: Container(
                height: 5.h,
                width: 8.w,
                decoration: BoxDecoration(
                    color: purble4.withOpacity(0.7), shape: BoxShape.circle),
              ),
            ),
            FittedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    hoverColor: white.withOpacity(0),
                    icon: Center(
                      child: Icon(
                        Icons.group,
                        color: purble2,
                        size: 25.sp,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        alignIndex = 0;
                      });
                    },
                  ),
                  IconButton(
                    hoverColor: white.withOpacity(0),
                    icon: Center(
                      child: Icon(
                        Icons.public_rounded,
                        color: purble2,
                        size: 25.sp,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        alignIndex = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
