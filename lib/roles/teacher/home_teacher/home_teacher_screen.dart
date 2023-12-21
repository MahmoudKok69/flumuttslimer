import 'dart:io';

import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/extension.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purble2,
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
                      color: AppColors.black,
                    ),
                    SizedBox(width: 8), // توسيع المسافة حسب الحاجة
                    Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                          color: AppColors.grey1,
                          fontFamily: AppFonts.bj,
                          fontSize: 16.sp),
                    ).arabicText(),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'تغيير الصورة',
                child: Row(
                  children: [
                    Icon(
                      Icons.image,
                      color: AppColors.black,
                    ),
                    const SizedBox(width: 8), // توسيع المسافة حسب الحاجة
                    Text(
                      'تغيير الصورة',
                      style: TextStyle(
                          color: AppColors.grey1,
                          fontFamily: AppFonts.bj,
                          fontSize: 16.sp),
                    ).arabicText(),
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
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 22.sp,
                    color: AppColors.purble1,
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
              color: AppColors.white,
              fontFamily: AppFonts.bj,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.notification_add_sharp),
          iconSize: 16.sp,
          color: AppColors.white,
          onPressed: () {
            Get.toNamed(AppPages.ad);
          },
        ),
        actionsIconTheme: IconThemeData(color: AppColors.white),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 45.h,
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
                      color: AppColors.purble2,
                    ),
                    color: AppColors.purble2,
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppPages.add_group);
                    },
                    child: Center(
                      child: Text(
                        ' إنشاء مجموعة جديدة',
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppFonts.bj,
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
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey2,
                      fontFamily: AppFonts.bj),
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
                      color: AppColors.purble2,
                    ),
                    color: AppColors.purble2,
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppPages.quizes_teacher);
                    },
                    child: Center(
                      child: Text(
                        ' إنشاء إختبار ',
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppFonts.bj,
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
                      color: AppColors.grey2,
                      fontFamily: AppFonts.bj),
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