import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/home_teacher_controller.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import 'widgets/home_teacher_components.dart';

class TeacherHomeScreen extends StatelessWidget {
  TeacherHomeScreen({super.key});

  final _controller = Get.find<HomeTeacherController>();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  var groupIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purble2,
        title: Center(
          child: Text(
            'الواجهة الرئيسية ',
            style: TextStyle(
              color: white,
              fontFamily: bj,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.notification_add_sharp),
          iconSize: 16.sp,
          color: white,
          onPressed: () {
            Get.toNamed(AppPages.ad);
          },
        ),
        actionsIconTheme: IconThemeData(color: white),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Container(
            height: 43.h,
            child: celander(
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDay: _selectedDay),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 6.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.sp,
                      color: purble2,
                    ),
                    color: purble2,
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppPages.add_group);
                    },
                    child: Center(
                      child: const Text(
                        ' إنشاء مجموعة جديدة',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Bahij',
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "  الحلقات    ",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: grey2,
                      fontFamily: bj),
                ),
              ],
            ),
          ),
          scroll_groups(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 6.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.sp,
                      color: purble2,
                    ),
                    color: purble2,
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppPages.add_group);
                    },
                    child: Center(
                      child: const Text(
                        ' إنشاء إختبار ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Bahij',
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  " الإختبارات ",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: grey2,
                      fontFamily: bj),
                ),
              ],
            ),
          ),
          SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ..._controller.quizes.map((e) {
                  groupIndex++;
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: MaterialButton(
                      onPressed: () {
                        Get.toNamed(
                          AppPages.mygroup,
                          parameters: {
                            // 'categ': e.categ!,
                            // 'count_students': e.count_students.toString(),
                            // 'name_institute': e.name_institute!,
                            // 'name_group': e.name_group!,
                            // 'invite_url': e.invite_url!,
                            // 'max_members': e.max_members.toString(),
                            // 'isPrivate': e.isPrivate,
                            // 'isAvailable': e.isAvailable
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 40.w,
                        height: 20.h,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                e.name_quiz!,
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style:
                                    TextStyle(fontFamily: bj, fontSize: 16.sp),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${e.count_Questions!.toString()}سؤال ',
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontFamily: bj, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  ' ${e.count_points!.toString()}نقطة',
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontFamily: bj, fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
              ]),
            ),
          )
        ],
      ),
    );
  }
}

// عرض اليوم الحالي
          // Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Text(
          //     'اليوم الحالي: ${_focusedDay.day}/${_focusedDay.month}/${_focusedDay.year}',
          //     style: TextStyle(fontSize: 18.0),
          //   ),
          // ),