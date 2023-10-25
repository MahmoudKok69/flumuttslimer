import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_controller.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});
  var _controller = Get.find<QuranController>();

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
                  'إنجازاتي',
                  style: TextStyle(
                      color: white,
                      fontFamily: bj,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp),
                ),
                Text(
                  'المصحف الشريف',
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
                itemCount: _controller.events.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = _controller.events[index];
                  return Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: GetBuilder<QuranController>(
                        init: QuranController(),
                        builder: (_) {
                          return ListTile(
                            // onTap: () {
                            //   Get.toNamed(AppPages.sAzkardetail, parameters: {
                            //     'name': item.name!,
                            //     'content': item.descirbe!,
                            //     'time': 'الصباح'
                            //   });
                            // },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp)),
                            title: Padding(
                              padding: EdgeInsets.only(bottom: 15.0.sp),
                              child: Text(
                                item.name!,
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: black,
                                  fontFamily: bj,
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                            tileColor: purble4,
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  item.points.toString(),
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: purble1,
                                    fontFamily: bj,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: CircleAvatar(
                                      radius: 3.sp, backgroundColor: black),
                                ),
                                Text(
                                  '${item.date!.year}/${item.date!.month}/${item.date!.day}',
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: purble1,
                                    fontFamily: bj,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: CircleAvatar(
                                      radius: 3.sp, backgroundColor: black),
                                ),
                                Text(
                                  item.teacherName!,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: purble1,
                                    fontFamily: bj,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
                itemCount: _controller.alSour.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = _controller.alSour[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: 3),
                      leading: SizedBox(
                        height: 40.h,
                        width: 30.w,
                        child: Row(
                          children: [
                            Container(
                              height: 35.sp,
                              width: 35.sp,
                              decoration: BoxDecoration(
                                color: purble1,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  item.number!,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      color: white,
                                      fontFamily: bj,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              height: 35.sp,
                              width: 35.sp,
                              decoration: BoxDecoration(
                                color: purble1,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        // Get.toNamed(AppPages.sAzkardetail, parameters: {
                        //   'name': item.name!,
                        //   'content': item.descirbe!,
                        //   'time': 'الصباح'
                        // });
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
