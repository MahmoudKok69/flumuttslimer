import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/Home_teacher_controller.dart';
import 'package:flumuttslimer/roles/teacher/home_teacher/widgets/home_teacher_components.dart';
import 'package:flumuttslimer/roles/teacher/new_upd_group/add_group_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class Home_teacher extends StatelessWidget {
  Home_teacher({super.key});

  final _controller = Get.find<HomeTeacherController>();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
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
          icon: Icon(Icons.notifications),
          iconSize: 16.sp,
          color: white,
          onPressed: () {
            Get.toNamed(AppPages.sNews);
          },
        ),
        actionsIconTheme: IconThemeData(color: white),
        automaticallyImplyLeading: false,
      ),
      //  endDrawer: SizedBox(
      //   width: 70.w,
      //   child: _homeDrawer(),
      // ),
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          celander(
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDay: _selectedDay),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppPages.add_group);
                  },
                  child: Text(
                    ' إنشاء مجموعة جديدة',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: purble3,
                    padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20), // زيادة حجم الحشو داخل الزر
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