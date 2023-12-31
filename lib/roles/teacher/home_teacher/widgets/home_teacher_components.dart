import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/extension.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/common.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/home_teacher_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class celander extends StatelessWidget {
  const celander({
    super.key,
    required DateTime focusedDay,
    required CalendarFormat calendarFormat,
    required DateTime? selectedDay,
  })  : _focusedDay = focusedDay,
        _calendarFormat = calendarFormat,
        _selectedDay = selectedDay;

  final DateTime _focusedDay;
  final CalendarFormat _calendarFormat;
  final DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      rowHeight: 5.h,
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2021, 1, 1),
      lastDay: DateTime.utc(2029, 12, 31),
      calendarStyle: CalendarStyle(
          defaultTextStyle: TextStyle(
            fontFamily: AppFonts.bj,
            fontSize: 8.sp,
            fontWeight: FontWeight.bold,
          ),
          todayTextStyle: TextStyle(
              fontFamily: AppFonts.bj,
              fontSize: 6.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
          weekendTextStyle: TextStyle(
              fontFamily: AppFonts.bj,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black),
          outsideTextStyle: TextStyle(
              fontFamily: AppFonts.bj,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black),
          todayDecoration:
              BoxDecoration(color: AppColors.purble3, shape: BoxShape.circle)),
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        // setState(() {
        //   _calendarFormat = format;
        // });
      },
      onDaySelected: (selectedDay, focusedDay) {
        // setState(() {
        //   _selectedDay = selectedDay;
        //   _focusedDay = focusedDay;
        // });
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
    );
    // return TableCalendar(
    //   firstDay: DateTime.utc(2021, 1, 1),
    //   lastDay: DateTime.utc(2029, 12, 31),
    //   focusedDay: _focusedDay,
    //   calendarStyle: CalendarStyle(
    //     cellMargin: EdgeInsets.all(0.0),
    //     outsideDaysVisible: false,
    //     // weekendStyle: TextStyle().copyWith(color: Colors.blue),
    //     // holidayStyle: TextStyle().copyWith(color: Colors.blue),
    //     // todayStyle: TextStyle().copyWith(color: Colors.red),
    //     // selectedStyle: TextStyle().copyWith(color: Colors.AppColors.white),
    //     todayDecoration: BoxDecoration(
    //       color: Colors.purple,
    //       shape: BoxShape.circle,
    //     ),
    //   ),
    //   calendarBuilders: CalendarBuilders(
    //     defaultBuilder: (context, date, _) {
    //       return Container(
    //         margin: EdgeInsets.all(2),
    //         alignment: Alignment.center,
    //         child: Text(
    //           '${date.day}',
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       );
    //     },
    //     todayBuilder: (context, date, _) {
    //       return Container(
    //         margin: EdgeInsets.all(2),
    //         alignment: Alignment.center,
    //         decoration: BoxDecoration(
    //           color: Colors.blue, // لون اليوم الحالي
    //           shape: BoxShape.circle,
    //         ),
    //         child: Text(
    //           '${date.day}',
    //           style: TextStyle(fontSize: 14, color: Colors.AppColors.white),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}

class scroll_groups extends StatelessWidget {
  scroll_groups({
    super.key,
  });
  final _controller = Get.find<HomeTeacherController>();

  var groupIndex = 0;
  bool isButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ..._controller.groups.map((e) {
            groupIndex++;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: MaterialButton(
                onPressed: () {
                  Get.toNamed(AppPages.mygroup,
                      parameters: {
                        'categ': e.categ!,
                        'count_students': e.count_students.toString(),
                        'name_institute': e.name_institute!,
                        'name_group': e.name_group!,
                        'invite_url': e.invite_url!,
                        'max_members': e.max_members.toString(),
                        // 'isPrivate': e.isPrivate,
                        // 'isAvailable': e.isAvailable
                      },
                      arguments: e
                      //  {
                      //   e.categ,
                      //   e.count_students,
                      //   e.name_institute,
                      //   e.name_group,
                      //   e.invite_url,
                      //   e.max_members,
                      //   e.isPrivate,
                      //   e.isAvailable
                      // }
                      );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 80.w,
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
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${e.categ}',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontFamily: AppFonts.bj, fontSize: 22.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Icon(
                            Icons.person_2_outlined,
                            size: 18.sp,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${e.count_students}',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontFamily: AppFonts.bj, fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Icon(
                            Icons.group,
                            size: 18.sp,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${e.name_institute}',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontFamily: AppFonts.bj, fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Icon(
                            Icons.school_outlined,
                            size: 18.sp,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            e.isPrivate! ? 'خاصة' : 'عامة',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontFamily: AppFonts.bj, fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Icon(
                            Icons.lock,
                            size: 18.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        '${e.name_group}',
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.bj),
                      )
                    ],
                  ),
                ),
              ),
            );
          })
        ]),
      ),
    );
  }
}

class scroll_quizes extends StatelessWidget {
  const scroll_quizes({
    super.key,
    required HomeTeacherController controller,
  }) : _controller = controller;

  final HomeTeacherController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ..._controller.quizes.map((e) {
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
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            e.name_quiz!,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontFamily: AppFonts.bj, fontSize: 22.sp),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Text(
                              '${e.count_Questions!.toString()}   سؤال ',
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontFamily: AppFonts.bj, fontSize: 18.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              ' ${e.count_points!.toString()} نقطة',
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontFamily: AppFonts.bj, fontSize: 18.sp),
                            ),
                          ],
                        ).rightDirction(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          })
        ]),
      ),
    );
  }
}
