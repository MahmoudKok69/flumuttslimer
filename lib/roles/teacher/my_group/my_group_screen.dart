import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/common.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/Home_teacher_controller.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flumuttslimer/roles/teacher/my_group/my_group_controller.dart';
import 'package:flumuttslimer/roles/teacher/my_group/widgets/my_group_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TeacherGroupsScreen extends StatelessWidget {
  TeacherGroupsScreen({
    super.key,
    this.categ,
    this.count_students,
    this.name_institute,
    this.name_group,
    this.invite_url,
    this.max_members,
    this.isPrivate,
    this.isAvailable,
  });
  String? categ;
  int? count_students;
  String? name_institute;
  String? name_group;
  String? invite_url;
  int? max_members;
  bool? isPrivate;
  bool? isAvailable;
  var data = Get.parameters;
  var data2 = Get.arguments;

  final _controller = Get.find<TeacherGroupsController>();
  final _formKey = GlobalKey<FormState>();
  var userInde = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purble2,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: white,
            size: 16.sp,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.link,
                color: white,
                size: 16.sp,
              )),
          IconButton(
              onPressed: () {
                print(
                  data['categ']!,
                );
                Get.toNamed(AppPages.update_info_group, parameters: {
                  'categ': data['categ']!,
                  'count_students': data['count_students']!,
                  'name_institute': data['name_institute']!,
                  'name_group': data['name_group']!,
                  'invite_url': data['invite_url']!,
                  'max_members': data['max_members']!,
                });
              },
              icon: Icon(
                Icons.edit,
                color: white,
                size: 16.sp,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: white,
                size: 16.sp,
              )),
        ],
      ),
      body: ListView(children: [
        info_group(data: data),
        ..._controller.List_student.map((e) {
          userInde++;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
              child: ListTile(
                  onTap: () {
                    Get.toNamed(AppPages.profile_student, parameters: {
                      'path_image': e.path_image!,
                      'name_student': e.name_student!,
                      'age': e.age.toString(),
                      'points': e.points.toString(),
                      'country': e.country!,
                    });
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
                                value: _controller
                                        .selectedAchievement.value.isEmpty
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  tileColor: white,
                  style: ListTileStyle.list,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: purble1),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                '$userInde',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: orange1,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: bj),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            e.name_student!,
                            style: TextStyle(
                              color: black,
                              fontFamily: bj,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'العمر : ${e.age.toString()}',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: black,
                              fontFamily: bj,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            const WidgetSpan(child: PointIcon()),
                            TextSpan(
                                text: "عدد النقاط :${e.points.toString()}",
                                // maxLine: 5,
                                style: TextStyle(
                                    color: grey1,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    fontFamily: bj)),
                          ])),
                        ],
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 80.sp,
                          width: 80.sp,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: purble4),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        }),
      ]),
    );
  }
}

class Form_memorizing extends StatelessWidget {
  const Form_memorizing({
    super.key,
    required TeacherGroupsController controller,
  }) : _controller = controller;

  final TeacherGroupsController _controller;

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
        GetBuilder<TeacherGroupsController>(
            init: TeacherGroupsController(),
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
    required TeacherGroupsController controller,
    required GlobalKey<FormState> formKey,
  })  : _controller = controller,
        _formKey = formKey;

  final TeacherGroupsController _controller;
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
