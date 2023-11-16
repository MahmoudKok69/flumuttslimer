import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/beauti/beauti_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BeautiCard extends StatelessWidget {
  BeautiCard({super.key, this.item, this.index});
  final item;
  final index;
  final _controller = Get.find<BeuatiController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
      child: GestureDetector(
        onTap: () {
          _controller.check(index);
        },
        child: Container(
          width: Get.size.width,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.4),
                blurRadius: 1,
                offset: const Offset(2, 3),
                spreadRadius: 1,
              )
            ],
            borderRadius: BorderRadius.circular(5.sp),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(right: 2.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GetBuilder<BeuatiController>(
                            init: BeuatiController(),
                            builder: (_) {
                              return Text(
                                item.name!,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: purble1,
                                  fontFamily: bj,
                                  fontSize: 12.sp,
                                  decoration: item.isChecked!
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              );
                            }),
                        Text(
                          item.describe!,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: purble2, fontFamily: bj, fontSize: 8.sp),
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '${item.points} نقطة',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: purble1, fontFamily: bj, fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: GetBuilder<BeuatiController>(
                      init: BeuatiController(),
                      builder: (_) {
                        return Container(
                          height: Get.size.height * 0.3,
                          width: Get.size.width * 0.4,
                          decoration: BoxDecoration(
                              color: orange1,
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: item.isChecked!
                              ? Center(
                                  child: Container(
                                    height: Get.size.height * 0.3,
                                    width: Get.size.width * 0.4,
                                    decoration: BoxDecoration(
                                      color: purble4.withOpacity(0.5),
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(30.sp),
                                      child: CircleAvatar(
                                        radius: 20.sp,
                                        backgroundColor: purble1,
                                        child: Icon(
                                          Icons.check,
                                          color: white,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
