import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
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
      firstDay: DateTime.utc(2021, 1, 1),
      lastDay: DateTime.utc(2029, 12, 31),
      calendarStyle: CalendarStyle(
          defaultTextStyle: TextStyle(
            fontFamily: bj,
            fontSize: 14.sp,
          ),
          todayTextStyle: TextStyle(
              fontFamily: bj,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: white),
          todayDecoration:
              BoxDecoration(color: purble3, shape: BoxShape.circle)),
      focusedDay: _focusedDay,
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
  }
}

class scroll_groups extends StatelessWidget {
  scroll_groups({
    super.key,
  });
  final _controller = Get.find<HomeTeacherController>();
  var groupIndex = 0;
  final _formKey = GlobalKey<FormState>();
  bool isButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                onLongPress: () {
                  Get.defaultDialog(
                    title: 'إضافة إنجاز',
                    content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DropdownButton<String>(
                              hint: Text(
                                'اختر إنجازًا',
                                style: TextStyle(fontFamily: bj),
                              ),
                              onChanged: (String? value) {
                                print('تم اختيار $value');
                                setState(() {
                                  // عند اختيار العنصر الأول، قم بتعيين حالة الزر للظهور
                                  _controller.select(value!);
                                });
                              },
                              value:
                                  _controller.selectedAchievement.value.isEmpty
                                      ? null
                                      : _controller.selectedAchievement.value,
                              items: _controller.list_Achievements.map((e) {
                                return DropdownMenuItem<String>(
                                  value: e.name_Achievement,
                                  child: Text(e.name_Achievement),
                                );
                              }).toList(),
                            ),
                            if (_controller.selectedAchievement.value ==
                                _controller
                                    .list_Achievements[0].name_Achievement)
                              Form_reciting(
                                  controller: _controller, formKey: _formKey),
                            if (_controller.selectedAchievement.value ==
                                _controller
                                    .list_Achievements[1].name_Achievement)
                              Form_memorizing(controller: _controller),
                          ],
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 35.w,
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${e.categ}',
                            style: TextStyle(fontFamily: bj, fontSize: 16.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          const Icon(Icons.person_2_outlined),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${e.count_students}',
                            style: TextStyle(fontFamily: bj, fontSize: 16.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          const Icon(Icons.group),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${e.name_institute}',
                            style: TextStyle(fontFamily: bj, fontSize: 16.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          const Icon(Icons.school_outlined),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        '${e.name_group}',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: bj),
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

class Form_memorizing extends StatelessWidget {
  const Form_memorizing({
    super.key,
    required HomeTeacherController controller,
  }) : _controller = controller;

  final HomeTeacherController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'رقم الجزء',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, fontFamily: bj),
        ),
        GetBuilder<HomeTeacherController>(
            init: HomeTeacherController(),
            id: 'selected_part',
            builder: (_) {
              return Padding(
                padding: EdgeInsets.all(2.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Slider(
                        divisions: 19,
                        value: _controller.selected_part.toDouble(),
                        min: 1,
                        max: 30,
                        onChanged: (value) {
                          _controller.set_part(value.toInt());
                        },
                        label: _controller.selected_part.toString(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 15.sp,
                        backgroundColor: purble4,
                        child: Text(
                          '${_controller.selected_part}',
                          style: TextStyle(
                            color: purble2,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
        SizedBox(
          height: 1.h,
        ),
        Text(
          textAlign: TextAlign.end,
          ':تقييم الطالب',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, fontFamily: bj),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => GestureDetector(
                      onTap: () {
                        _controller.selectStar(index + 1);
                      },
                      child: Icon(
                        Icons.star,
                        size: 40,
                        color: index < _controller.selectedStar.value
                            ? Colors.orange
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _controller.add_achievement_memorizing();
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: purble2,
              padding: const EdgeInsets.symmetric(
                  horizontal: 50, vertical: 20), // زيادة حجم الحشو داخل الزر
            ),
            child: const Text(
              'إضافة',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class Form_reciting extends StatelessWidget {
  const Form_reciting({
    super.key,
    required HomeTeacherController controller,
    required GlobalKey<FormState> formKey,
  })  : _controller = controller,
        _formKey = formKey;

  final HomeTeacherController _controller;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  decoration: inputDecorationStyle('رقم الصفحة', ''),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], // يقبل أرقام فقط
                  keyboardType: TextInputType.number, // يظهر لوحة مفاتيح أعداد
                  onChanged: (value) {
                    int parsedValue = int.tryParse(value) ?? 0;
                    _controller.setfrom_the_page(parsedValue);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  textAlign: TextAlign.end,
                  'من الصفحة',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: bj),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  decoration: inputDecorationStyle('رقم الصفحة', ''),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], // يقبل أرقام فقط
                  keyboardType: TextInputType.number, // يظهر لوحة مفاتيح أعداد
                  onChanged: (value) {
                    int parsedValue = int.tryParse(value) ?? 0;
                    _controller.setto_the_page(parsedValue);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  textAlign: TextAlign.end,
                  'إلى الصفحة',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: bj),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            textAlign: TextAlign.end,
            ':تقييم الطالب',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, fontFamily: bj),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          _controller.selectStar(index + 1);
                        },
                        child: Icon(
                          Icons.star,
                          size: 40,
                          color: index < _controller.selectedStar.value
                              ? Colors.orange
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Obx(
                //   () => Text(
                //     'النجمة المختارة: ${_controller.selectedStar.value}',
                //     style: TextStyle(fontSize: 20),
                //   ),
                // ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // if (_controller.from_the_page > _controller.to_the_page) {
              //   Get.defaultDialog(
              //     //   title: 'Dialog Title',
              //     content: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text(
              //           'المدخلات غير منطقية',
              //           style: TextStyle(fontSize: 18),
              //         ),
              //       ],
              //     ),
              //   );
              // }
              if (_formKey.currentState!.validate()) {
                print('Ok');
                _controller.add_achievement_reciting();
                Get.back();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: purble2,
              padding: const EdgeInsets.symmetric(
                  horizontal: 50, vertical: 20), // زيادة حجم الحشو داخل الزر
            ),
            child: const Text(
              'إضافة',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
