import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/features/rank/rank_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RankScreen extends StatelessWidget {
  RankScreen({super.key});

  final _controller = Get.find<RankController>();
  var userInde = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  Expanded(
                    flex: 1,
                    child: Padding(
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
                            height: 60.h,
                            width: 40.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    child: Image.asset(
                                      'assets/images/gifs/crown.gif',
                                      fit: BoxFit.cover,
                                      width: 35.w,
                                      height: 12.h,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    _controller.users[0].name!,
                                    style: TextStyle(
                                      color: white,
                                      fontFamily: bj,
                                      fontSize: 25.sp,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(
                                    height: 20.h,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 60.w,
                                          height: 20.h,
                                          decoration: BoxDecoration(
                                            color: orange1,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
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
                                                  width: 4,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignOutside,
                                                )),
                                            child: Center(
                                                child: Text(
                                              '1',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: purble2,
                                                  fontSize: 18.sp,
                                                  fontFamily: bj,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    _controller.users[0].points.toString(),
                                    style: TextStyle(
                                      color: white,
                                      fontFamily: bj,
                                      fontSize: 25.sp,
                                    ),
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
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      _controller.users[1].name!,
                                      style: TextStyle(
                                        color: white,
                                        fontFamily: bj,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: SizedBox(
                                      height: 14.h,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 40.w,
                                            height: 15.h,
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
                                                    color:
                                                        Colors.green.shade500,
                                                    width: 4,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignOutside,
                                                  )),
                                              child: Center(
                                                  child: Text(
                                                '2',
                                                style: TextStyle(
                                                    color: purble2,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: bj),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      _controller.users[1].points.toString(),
                                      style: TextStyle(
                                        color: white,
                                        fontFamily: bj,
                                        fontSize: 25.sp,
                                      ),
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
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      _controller.users[2].name!,
                                      style: TextStyle(
                                        color: white,
                                        fontFamily: bj,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: SizedBox(
                                      height: 16.h,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 40.w,
                                            height: 15.h,
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
                                                    color:
                                                        Colors.green.shade500,
                                                    width: 4,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignOutside,
                                                  )),
                                              child: Center(
                                                  child: Text(
                                                '3',
                                                style: TextStyle(
                                                    color: purble2,
                                                    fontSize: 14.sp,
                                                    fontFamily: bj,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    _controller.users[2].points.toString(),
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
            ..._controller.users.skip(3).map((e) {
              userInde++;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    tileColor: purble5,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: purble1),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  '${4}',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: orange1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              e.name!,
                              style: TextStyle(
                                color: black,
                                fontFamily: bj,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'العمر : ${e.age.toString()}',
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: black,
                                fontFamily: bj,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'عدد النقاط :${e.points.toString()}',
                              style: TextStyle(
                                color: black,
                                fontFamily: bj,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'اسم المعلم: ${e.teacherName!}',
                              style: TextStyle(
                                color: black,
                                fontFamily: bj,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 100.sp,
                            width: 100.sp,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: purble4),
                          ),
                        ),
                      ],
                    )),
              );
            }),
          ],
        ),
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
        padding: EdgeInsets.symmetric(horizontal: 1.w),
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
            SizedBox(
              height: 5.h,
              width: 18.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      hoverColor: white.withOpacity(0),
                      icon: Center(
                        child: Icon(
                          Icons.group,
                          color: purble2,
                          size: 15.sp,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          alignIndex = 0;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      hoverColor: white.withOpacity(0),
                      padding: EdgeInsets.all(0),
                      icon: Center(
                        child: Icon(
                          Icons.public_rounded,
                          color: purble2,
                          size: 15.sp,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          alignIndex = 1;
                        });
                      },
                    ),
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
