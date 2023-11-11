import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/features/prizes/prizes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';

class PrizesBody extends StatelessWidget {
  PrizesBody({super.key});
  var _controller = Get.find<PrizesController>();
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Padding(
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
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: purble5,
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Row(children: [
                        Expanded(
                            flex: 3,
                            child: FittedBox(
                              child: Padding(
                                padding: EdgeInsets.only(left: 1.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Spacer(),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 5.h,
                                        width: 20.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: purble2,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 20.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        color: purble4,
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'مستلمة',
                                        style: TextStyle(
                                            color: purble2,
                                            fontFamily: bj,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    Spacer(),
                                  ],
                                ),
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
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: bj,
                                    fontSize: 15.sp),
                              ),
                              Text(
                                'الفئة العمرية: ${item.age}',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: bj,
                                    fontSize: 15.sp),
                              ),
                              Text(
                                '${item.points}',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: bj,
                                    fontSize: 15.sp),
                              ),
                              Text(
                                '!مكتمل',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: purble2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: bj,
                                    fontSize: 25.sp),
                              ),
                              Spacer(),
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
                                  color: purble3,
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
        ),
        Padding(
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
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: purble5,
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        child: Row(children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                Spacer(),
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
                                            color: purble2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${item.name}',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: bj,
                                                fontSize: 15.sp),
                                          ),
                                          Text(
                                            'الفئة العمرية: ${item.age}',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: bj,
                                                fontSize: 15.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Spacer(),
                                SizedBox(
                                  child: SizedBox(
                                    width: 50.w,
                                    height: 5.h,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: Get.size.width,
                                          decoration: BoxDecoration(
                                            color: purble4,
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                          ),
                                        ),
                                        Container(
                                          width: (75 / item.points!) * 50.w,
                                          decoration: BoxDecoration(
                                            color: purble3,
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Spacer(),
                                      Text(
                                        "75",
                                        style: TextStyle(
                                            color: purble2,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: bj,
                                            fontSize: 12.sp),
                                      ),
                                      Spacer(
                                        flex: 5,
                                      ),
                                      Text(
                                        '${item.points}',
                                        style: TextStyle(
                                            color: purble2,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: bj,
                                            fontSize: 12.sp),
                                      ),
                                      Spacer(),
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
                                    color: purble3,
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
        ),
      ],
    );
  }
}
