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
          icon: const Icon(Icons.notifications),
          iconSize: 16.sp,
          color: white,
          onPressed: () {
            Get.toNamed(AppPages.sNews);
          },
        ),
        actionsIconTheme: IconThemeData(color: white),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          celander(
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDay: _selectedDay),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppPages.add_group);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purble3,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20), // زيادة حجم الحشو داخل الزر
                  ),
                  child: const Text(
                    ' إنشاء مجموعة جديدة',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  "الحلقات   ",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold, color: grey2),
                ),
              ],
            ),
          ),
          scroll_groups()
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