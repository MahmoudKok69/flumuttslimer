import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/features/beauti/beauti_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class BeuatiScreen extends StatelessWidget {
  BeuatiScreen({super.key});
  var _controller = Get.find<BeuatiController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purble2,
        title: Center(
          child: Text(
            'الأخلاق و الجمال',
            style: TextStyle(
              fontFamily: bj,
              fontWeight: FontWeight.w500,
              color: white,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20.sp,
            color: white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _controller.beuatiList.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _controller.beuatiList[index];
          return Padding(
            padding: EdgeInsets.all(8.0.sp),
            child: GestureDetector(
              onTap: () {
                _controller.check(index);
              },
              child: Container(
                width: Get.size.width,
                height: Get.size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: purble5,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          // width: 70.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GetBuilder<BeuatiController>(
                                  init: BeuatiController(),
                                  builder: (_) {
                                    return Text(
                                      item.name!,
                                      style: TextStyle(
                                        color: purble1,
                                        fontFamily: bj,
                                        fontSize: 20.sp,
                                        decoration: item.isChecked!
                                            ? TextDecoration.lineThrough
                                            : null,
                                      ),
                                    );
                                  }),
                              SizedBox(
                                height: Get.size.height * 0.25 * 0.5,
                                child: Text(
                                  item.describe!,
                                  style: TextStyle(
                                      color: purble2,
                                      fontFamily: bj,
                                      fontSize: 14.sp),
                                  maxLines: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                item.points.toString(),
                                style: TextStyle(
                                    color: purble1,
                                    fontFamily: bj,
                                    fontSize: 14.sp),
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
                                // width: 30.w,
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
                                                size: 30.sp,
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
        },
      ),
    );
  }
}
