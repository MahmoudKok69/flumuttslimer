import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/common.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/Azkar_components.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_controller.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/question_model.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/Home_teacher_controller.dart';
import 'package:flumuttslimer/roles/teacher/quize/add_quiz_components.dart';
import 'package:flumuttslimer/roles/teacher/quize/controllers/quiz_controller.dart';
import 'package:flumuttslimer/roles/teacher/quize/controllers/share_quiz_controller.dart';
import 'package:flumuttslimer/roles/teacher/quize/models/Add_QuizModel.dart';

import 'package:flumuttslimer/router_.dart';
import 'package:flumuttslimer/roles/teacher/my_group/my_group_controller.dart';
import 'package:flumuttslimer/roles/teacher/my_group/widgets/my_group_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sizer/sizer.dart';

class AddQuizScreen extends StatelessWidget {
  AddQuizScreen({
    super.key,
  });

  final _controller = Get.find<QuizController>();
  final _formKey = GlobalKey<FormState>();
  var questionInde = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.purble2,
            title: Center(
              child: Text(
                'إضافة إختبار',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: AppFonts.bj,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(
                AppIcons.back_icon,
                color: AppColors.white,
                size: 16.sp,
              ),
              onPressed: () {
                if (_controller.List_Questions.length > 0) {
                  Get.defaultDialog(
                    title: 'تحذير',
                    content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.warning_rounded,
                              color: Colors.red,
                              size: 30.sp,
                            ),
                            Text(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              'بحال وافقت على الرجوع سيتم حذف الإختبار  الذي أدخلته',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 10.sp,
                                fontFamily: 'Bahij',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 6.h,
                                width: 18.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.sp,
                                      color: AppColors.purble2,
                                    ),
                                    borderRadius: BorderRadius.circular(5.sp),
                                    color: AppColors.purble2),
                                child: Center(
                                  child: Text(
                                    'رجوع',
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 10.sp,
                                      fontFamily: 'Bahij',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                  // _controller.List_Questions.clear();
                } else {
                  Get.back();
                }
              },
            ),
            bottom: TabBar(
                indicatorColor: AppColors.white,
                automaticIndicatorColorAdjustment: true,
                overlayColor: MaterialStateProperty.all(AppColors.purble3),
                labelColor: AppColors.white,
                unselectedLabelColor: AppColors.grey2,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Text(
                    'الأسئلة',
                    style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppFonts.bj,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                  Text(
                    'إضافة سؤال',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFonts.bj,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    'إرسال',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFonts.bj,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),
                ]),
          ),
          // floatingActionButton: InkWell(
          //   onTap: () {},
          //   child: Opacity(
          //     opacity: 0.9,
          //     child: Container(
          //       width: 26.w,
          //       height: 8.h,
          //       decoration: BoxDecoration(
          //         color: AppColors.purble3,
          //         borderRadius: BorderRadius.circular(10.sp),
          //       ),
          //       child: Center(
          //           child: Text(
          //         ' إرسال الإختبار',
          //         maxLines: 1,
          //         style: TextStyle(
          //             color: AppColors.white,
          //             fontFamily:AppFonts.bj,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 8.sp),
          //       )),
          //     ),
          //   ),
          // ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TabBarView(
              children: [
                //  Container(),ذ
                view_Questions(controller: _controller),
                Add_Question(),
                The_Question(
                  formKey: _formKey,
                  quiz_name: _controller.name_quiz,
                ),
              ],
            ),
          ),
        ));
  }
}

class view_Questions extends StatelessWidget {
  view_Questions({
    super.key,
    required QuizController controller,
  }) : _controller = controller;

  final QuizController _controller;
  var questionInde = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        //id: 'setvalue_choose',
        init: _controller,
        builder: (_) {
          return ListView(
            children: [
              ..._controller.List_Questions.map((e) {
                return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
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
                        child: ListTile(
                            tileColor: AppColors.white,
                            style: ListTileStyle.list,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.red,
                                      ),
                                    ),
                                    ArabicText(
                                      text: 'السؤال : ${++questionInde}',
                                      fontSize: 14.sp,
                                      // fontFamily:AppFonts.bj,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                ArabicText(
                                  text: ' ${e['question']}',
                                  fontSize: 14.sp,
                                  // fontFamily:AppFonts.bj,
                                  fontWeight: FontWeight.w500,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ArabicText(
                                      text: ' ${e['option1']}',
                                      fontSize: 14.sp,
                                      // fontFamily:AppFonts.bj,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: e['correctAnswer'] == 1
                                          ? AppColors.green1
                                          : Colors.red,
                                      size: 10.sp,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ArabicText(
                                      text: ' ${e['option2']}',
                                      fontSize: 14.sp,
                                      // fontFamily:AppFonts.bj,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: e['correctAnswer'] == 2
                                          ? AppColors.green1
                                          : Colors.red,
                                      size: 10.sp,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ArabicText(
                                      text: ' ${e['option3']}',
                                      fontSize: 14.sp,
                                      // fontFamily:AppFonts.bj,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: e['correctAnswer'] == 3
                                          ? AppColors.green1
                                          : Colors.red,
                                      size: 10.sp,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ArabicText(
                                      text: ' ${e['option4']}',
                                      fontSize: 14.sp,
                                      // fontFamily:AppFonts.bj,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: e['correctAnswer'] == 4
                                          ? AppColors.green1
                                          : Colors.red,
                                      size: 10.sp,
                                    ),
                                  ],
                                ),
                              ],
                            ))));
              }),
              SizedBox(
                height: 20.h,
              )
            ],
          );
        });
  }
}

class The_Question extends StatelessWidget {
  The_Question(
      {super.key, required GlobalKey<FormState> formKey, required quiz_name})
      : _formKey = formKey,
        _quiz_name = quiz_name;

  final GlobalKey<FormState> _formKey;
  String _quiz_name;
  final _controller = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _controller.name_quiz,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 12.sp,
                  fontFamily: 'Bahij',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ':إسم الإختبار',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 12.sp,
                  fontFamily: 'Bahij',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'الكل',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: AppFonts.bj,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    GetBuilder<QuizController>(
                      id: 'checked_all_groups',
                      init: QuizController(),
                      builder: (_) {
                        return CustomCheckBox(
                          height: 12.sp,
                          width: 12.sp,
                          selectColor: AppColors.purble2,
                          unselectColor: AppColors.purble5,
                          iconColor: AppColors.white,
                          borderRadius: 1.sp,
                          isChecked: _controller.ischecked_all,
                          iconSize: 12.sp,
                          onchange: () {
                            //=    isChecked == !isChecked;
                            _controller.checked_all_groups();
                          },
                        );
                      },
                    ),
                  ],
                ),
                Text(
                  'الفئة المستلمة',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: AppFonts.bj,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 2.h),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.sp),
                      border: Border.all(color: AppColors.white, width: 1.sp),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 2,
                            blurRadius: 10)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                      itemCount: _controller.groups.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = _controller.groups[index];
                        return Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: GetBuilder<QuizController>(
                              id: 'group_check',
                              init: QuizController(),
                              builder: (_) {
                                return PhysicalModel(
                                  elevation: 5,
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(5.sp),
                                  child: ListTile(
                                    shape: BeveledRectangleBorder(
                                      side: BorderSide(width: 0.01.w),
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    onTap: () {
                                      Get.toNamed(
                                        AppPages.mygroup,
                                        parameters: {
                                          'categ': item.categ!,
                                          'count_students':
                                              item.count_students.toString(),
                                          'name_institute':
                                              item.name_institute!,
                                          'name_group': item.name_group!,
                                          'invite_url': item.invite_url!,
                                          'max_members':
                                              item.max_members.toString(),
                                        },
                                      );
                                    },
                                    title: Text(
                                      item.name_institute!,
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontFamily: AppFonts.bj,
                                        fontSize: 12.sp,
                                        decoration:
                                            item.isChecked! ? null : null,
                                      ),
                                    ),
                                    tileColor: item.isChecked!
                                        ? AppColors.purble3
                                        : AppColors.purble4,
                                    leading: CustomCheckBox(
                                      height: 12.sp,
                                      width: 12.sp,
                                      selectColor: AppColors.purble2,
                                      unselectColor: AppColors.purble4,
                                      iconColor: AppColors.white,
                                      borderRadius: 1.sp,
                                      isChecked: item.isChecked,
                                      iconSize: 12.sp,
                                      onchange: () {
                                        _controller.group_check(index);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ));
                      },
                    ),
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: SizedBox(
                width: 70.w,
                height: 6.h,
                child: ElevatedButton(
                  onPressed: () {
                    //_controller.addQuiz
                    Get.defaultDialog(
                      title: '',
                      content: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 12, left: 12, right: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  ' هل انت متأكد من إرسال الإختبار',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 13.sp,
                                    fontFamily: 'Bahij',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Icon(
                                  Icons.warning_rounded,
                                  color: Colors.green,
                                  size: 30.sp,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      ' ${_controller.List_Questions.length}',
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 13.sp,
                                        fontFamily: 'Bahij',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      'عدد الأسئلة :',
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 13.sp,
                                        fontFamily: 'Bahij',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _controller.addQuiz();
                                  },
                                  child: Container(
                                    height: 6.h,
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.sp,
                                          color: AppColors.purble2,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.sp),
                                        color: AppColors.purble2),
                                    child: Center(
                                      child: Text(
                                        'إرسال',
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 10.sp,
                                          fontFamily: 'Bahij',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.purble2),
                  ),
                  child: Center(
                    child: Text(
                      ' إرسال',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: 'Bahij',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Add_Question extends StatelessWidget {
  Add_Question({
    super.key,
  });
  final _controller = Get.find<QuizController>();
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _Option1_Controller = TextEditingController();
  final TextEditingController _Option2_Controller = TextEditingController();
  final TextEditingController _Option3_Controller = TextEditingController();
  final TextEditingController _Option4_Controller = TextEditingController();
  final selectedValue = 1.obs;
  final _formKey = GlobalKey<FormState>();
  var index_question = 0;

  @override
  Widget build(BuildContext context) {
    var length = _controller.List_Questions.length;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Form(
        key: _formKey,
        child: ListView(
          //  crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'إسم الأختبار',
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: AppFonts.bj,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 1.h),
            TextFormField(
              //  controller: _textFieldController,
              initialValue: _controller.name_quiz,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.right,
              decoration: inputDecorationStyle(
                'إسم الأختبار',
                ' ...أدخل إسم الأختبار  ',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.trim().length < 1) {
                  return 'يرجى تعبئة الخانة';
                }
                return null;
              },
              onChanged: (value) {
                _controller.setname_quiz(value);
                print(_controller.name_quiz);
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            GetBuilder<QuizController>(
                id: 'add_question',
                init: QuizController(),
                builder: (_) {
                  return Text(
                    'السؤال :${_controller.currentQuestionIndex} ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.bj,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }),
            SizedBox(height: 1.h),
            TextFormField(
              controller: _questionController,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.right,
              decoration: inputDecorationStyle(
                'السؤال',
                ' ...أدخل السؤال  ',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.trim().length < 1) {
                  return 'يرجى تعبئة الخانة';
                }
                return null;
              },
              onChanged: (value) {
                print(_questionController.text);
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                title: Text(
                  ' الخيارات',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: AppFonts.bj,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  ' قم بأختيار الجواب الصحيح  و إلا سيتم أختيار الخيار الأول',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: AppFonts.bj,
                    color: AppColors.grey4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: TextFormField(
                    controller: _Option1_Controller,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                    decoration: inputDecorationStyle(
                      'الخيار الأول',
                      '...أدخل الخيار الأول',
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 1) {
                        return 'يرجى تعبئة الخانة';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //  _controller.setname(value);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Obx(() => Radio<int>(
                          value: 1,
                          groupValue: selectedValue.value,
                          onChanged: (value) {
                            selectedValue.value = value!;
                          },
                        )),
                  ),
                )
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: TextFormField(
                    controller: _Option2_Controller,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                    decoration: inputDecorationStyle(
                      'الخيار الثاني',
                      '...أدخل الخيار الثاني',
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 1) {
                        return 'يرجى تعبئة الخانة';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //  _controller.setname(value);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Obx(() => Radio<int>(
                          value: 2,
                          groupValue: selectedValue.value,
                          onChanged: (value) {
                            selectedValue.value = value!;
                            print(selectedValue.value);
                          },
                        )),
                  ),
                )
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: TextFormField(
                    controller: _Option3_Controller,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                    decoration: inputDecorationStyle(
                      'الخيار الثالت',
                      '...أدخل الخيار الثالت',
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 1) {
                        return 'يرجى تعبئة الخانة';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //  _controller.setname(value);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Obx(() => Radio<int>(
                          value: 3,
                          groupValue: selectedValue.value,
                          onChanged: (value) {
                            selectedValue.value = value!;
                          },
                        )),
                  ),
                )
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: TextFormField(
                    controller: _Option4_Controller,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                    decoration: inputDecorationStyle(
                      'الخيار الرابع',
                      '...أدخل الخيار الرابع',
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 1) {
                        return 'يرجى تعبئة الخانة';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //  _controller.setname(value);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Obx(() => Radio<int>(
                          value: 4,
                          groupValue: selectedValue.value,
                          onChanged: (value) {
                            selectedValue.value = value!;
                          },
                        )),
                  ),
                )
              ],
            ),
            SizedBox(height: 5.h),
            Center(
              child: SizedBox(
                width: 35.w,
                height: 6.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _controller.addToQuestionList(AddQuizModel(
                        name_quiz: _controller.name_quiz,
                        question: _questionController.text,
                        correctAnswer: selectedValue.value,
                        option1: _Option1_Controller.text,
                        option2: _Option2_Controller.text,
                        option3: _Option3_Controller.text,
                        option4: _Option4_Controller.text,
                      ));
                      print(_controller.List_Questions);
                      _questionController.text = '';
                      _Option1_Controller.text = '';
                      _Option2_Controller.text = '';
                      _Option3_Controller.text = '';
                      _Option4_Controller.text = '';
                      selectedValue.value = 1;

                      Get.showSnackbar(GetSnackBar(
                        duration: const Duration(seconds: 2),
                        backgroundColor: AppColors.white,
                        snackStyle: SnackStyle.GROUNDED,
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 3.w),
                        boxShadows: [
                          BoxShadow(color: AppColors.black, blurRadius: 5)
                        ],
                        animationDuration: const Duration(milliseconds: 500),
                        messageText: Text(
                          'تم إضافة السؤال بنجاح',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.grey1,
                            fontFamily: AppFonts.bj,
                            fontSize: 16.sp,
                          ),
                        ),
                      ));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.purble2),
                  ),
                  child: Center(
                    child: Text(
                      'إضافة السؤال',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: 'Bahij',
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h)
          ],
        ),
      ),
    );
  }
}
