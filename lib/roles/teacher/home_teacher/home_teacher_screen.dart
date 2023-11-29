import 'dart:io';

import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/home_teacher_controller.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import 'widgets/home_teacher_components.dart';

class TeacherHomeScreen extends StatefulWidget {
  TeacherHomeScreen({Key? key}) : super(key: key);

  @override
  _TeacherHomeScreenState createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  final _controller = Get.find<HomeTeacherController>();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  var groupIndex = 0;
  var _selectedValue = 'تغيير الصورة';
  var _usStates = ["تسجيل الخروج", "تغيير الصورة"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purble2,
        actions: [
          PopupMenuButton<String>(
            initialValue: _selectedValue,
            onSelected: (String value) {
              if (value == 'تسجيل الخروج') {
                exit(0);
              } else if (value == 'تغيير الصورة') {
                // قم بتنفيذ عملية تغيير الصورة
              }
              setState(() {
                _selectedValue = value;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'تسجيل الخروج',
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: black,
                    ),
                    SizedBox(width: 8), // توسيع المسافة حسب الحاجة
                    Text('تسجيل الخروج'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'تغيير الصورة',
                child: Row(
                  children: [
                    Icon(
                      Icons.image,
                      color: black,
                    ),
                    SizedBox(width: 8), // توسيع المسافة حسب الحاجة
                    Text('تغيير الصورة'),
                  ],
                ),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
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
                      Get.toNamed(AppPages.welcome);
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
          scroll_quizes(controller: _controller)
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