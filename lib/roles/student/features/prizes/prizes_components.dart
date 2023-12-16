import 'dart:math';

import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/prizes/prizes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PrizesBody extends StatelessWidget {
  PrizesBody({super.key});
  final _controller = Get.find<PrizesController>();
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        MyPrizes(controller: _controller),
        AllPrizes(controller: _controller),
      ],
    );
  }
}

class MyPrizes extends StatelessWidget {
  const MyPrizes({
    super.key,
    required PrizesController controller,
  }) : _controller = controller;

  final PrizesController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: ListView.builder(
        itemCount: _controller.prizes.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _controller.prizes[index];
          print(item);
          return Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: GetBuilder<PrizesController>(
              id: 'prizes_tile',
              init: PrizesController(),
              builder: (_) {
                return Container(
                  width: Get.size.width,
                  height: 25.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.4),
                        blurRadius: 1,
                        offset: const Offset(2, 3),
                        spreadRadius: 1,
                      )
                    ],
                    border: Border.all(color: AppColors.grey4, width: 1),
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: Row(children: [
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(left: 1.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Expanded(
                                  flex: 3,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.purble3,
                                    radius:
                                        min(Get.width * 0.5, Get.height * 0.5) /
                                            2,
                                  )),
                              const Spacer(),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: 20.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.purble4,
                                    borderRadius: BorderRadius.circular(2.sp),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'مستلمة',
                                    style: TextStyle(
                                        color: AppColors.purble2,
                                        fontFamily: AppFonts.bj,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w900),
                                  )),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Spacer(),
                          Text(
                            '${item.name}',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.bj,
                                fontSize: 12.sp),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            'الفئة العمرية: ${item.age}',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.bj,
                                fontSize: 12.sp),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            ' ${item.points} نقطة',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.bj,
                                fontSize: 12.sp),
                          ),
                          SizedBox(height: 2.h),
                          SizedBox(
                            width: 25.w,
                            child: Text(
                              '!مكتمل',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: AppColors.purble2,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppFonts.bj,
                                  fontSize: 14.sp),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.all(5.0.sp),
                        child: Container(
                          height: 25.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              color: AppColors.purble3,
                              borderRadius: BorderRadius.circular(5.sp)),
                        ),
                      ),
                    ),
                  ]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class AllPrizes extends StatelessWidget {
  const AllPrizes({
    super.key,
    required PrizesController controller,
  }) : _controller = controller;

  final PrizesController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: ListView.builder(
        itemCount: _controller.prizes.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _controller.prizes[index];
          return Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: GetBuilder<PrizesController>(
                id: 'prizes_tile',
                init: PrizesController(),
                builder: (_) {
                  return Container(
                    width: Get.size.width,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.4),
                          blurRadius: 1,
                          offset: const Offset(2, 3),
                          spreadRadius: 1,
                        )
                      ],
                      border: Border.all(width: 0.25.sp),
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    child: Row(children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5.w),
                                    child: Container(
                                      height: 10.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.pink,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${item.name}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppFonts.bj,
                                            fontSize: 12.sp),
                                      ),
                                      Text(
                                        'الفئة العمرية: ${item.age}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppFonts.bj,
                                            fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            const Spacer(),
                            SizedBox(
                              child: SizedBox(
                                width: 50.w,
                                height: 3.h,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: Get.size.width,
                                      decoration: BoxDecoration(
                                        color: AppColors.purble4,
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                      ),
                                    ),
                                    Container(
                                      //Todo:Points of user
                                      width: (75 / item.points!) * 50.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.purble3,
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 0.5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Spacer(),
                                  Text(
                                    "75 نقطة",
                                    style: TextStyle(
                                        color: AppColors.purble2,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: AppFonts.bj,
                                        fontSize: 9.sp),
                                  ),
                                  const Spacer(
                                    flex: 5,
                                  ),
                                  Text(
                                    '${item.points} نقطة',
                                    style: TextStyle(
                                        color: AppColors.purble2,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: AppFonts.bj,
                                        fontSize: 9.sp),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.all(5.0.sp),
                          child: Container(
                            height: 25.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: AppColors.purble3,
                                borderRadius: BorderRadius.circular(5.sp)),
                          ),
                        ),
                      )
                    ]),
                  );
                },
              ));
        },
      ),
    );
  }
}
