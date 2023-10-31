import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_controller.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});
  final _controller = Get.find<QuranController>();

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
              'القرأن الكريم',
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
                            onTap: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp)),
                            title: Padding(
                              padding: EdgeInsets.only(bottom: 8.0.sp),
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
                            tileColor: purble4.withOpacity(0.8),
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
              padding: EdgeInsets.all(0.sp),
              child: ListView.builder(
                itemCount: _controller.alSour.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = _controller.alSour[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: ListTile(
                      visualDensity: const VisualDensity(vertical: 3),
                      leading: Container(
                        height: 35.sp,
                        width: 35.sp,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Quran[index]['type_en'] == 'meccan'
                                ? AssetImage('assets/images/sorah/mka.png')
                                : AssetImage('assets/images/sorah/mdn.png'),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      onTap: () {
                        Get.toNamed(AppPages.sorah, parameters: {
                          'number': '$index',
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.sp)),
                      title: Text(
                        '${index + 1}- ${item!}',
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: black,
                            fontFamily: um,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      tileColor: purble5,
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
