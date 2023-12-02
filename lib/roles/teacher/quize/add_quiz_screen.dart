import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/common.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/Azkar_components.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/azkar_controller.dart';
import 'package:flumuttslimer/roles/teacher/Home_teacher/Home_teacher_controller.dart';
import 'package:flumuttslimer/roles/teacher/quize/add_quiz_components.dart';
import 'package:flumuttslimer/roles/teacher/quize/quiz_controller.dart';
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
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: _buildAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TabBarView(
              children: [
                The_Question(controller: _controller, formKey: _formKey),
                Add_Question(selectedValue: selectedValue),
              ],
            ),
          ),
        ));
  }
}

class The_Question extends StatelessWidget {
  const The_Question({
    super.key,
    required QuizController controller,
    required GlobalKey<FormState> formKey,
  })  : _controller = controller,
        _formKey = formKey;

  final QuizController _controller;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
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
                        fontFamily: bj,
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
                          selectColor: purble2,
                          unselectColor: purble5,
                          iconColor: white,
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
                    fontFamily: bj,
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
                      color: white,
                      borderRadius: BorderRadius.circular(20.sp),
                      border: Border.all(color: white, width: 1.sp),
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
                                  color: white,
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
                                        color: black,
                                        fontFamily: bj,
                                        fontSize: 12.sp,
                                        decoration: item.isChecked!
                                            ? TextDecoration.lineThrough
                                            : null,
                                      ),
                                    ),
                                    tileColor:
                                        item.isChecked! ? purble3 : purble4,
                                    leading: CustomCheckBox(
                                      height: 12.sp,
                                      width: 12.sp,
                                      selectColor: purble2,
                                      unselectColor: purble4,
                                      iconColor: white,
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
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(purble2),
                  ),
                  child: Center(
                    child: Text(
                      ' إرسال',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: white,
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
  const Add_Question({
    super.key,
    required this.selectedValue,
  });

  final int selectedValue;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        //  crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'إسم الأختبار',
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: bj,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 1.h),
          TextFormField(
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.right,
            decoration: inputDecorationStyle(
              'إسم الأختبار',
              ' ...أدخل إسم الأختبار  ',
            ),
            onChanged: (value) {
              //  _controller.setname(value);
            },
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'السؤال :1 ',
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: bj,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 1.h),
          TextFormField(
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.right,
            decoration: inputDecorationStyle(
              'السؤال',
              ' ...أدخل السؤال  ',
            ),
            onChanged: (value) {
              //  _controller.setname(value);
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
                  fontFamily: bj,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                ' قم بأختيار الجواب الصحيح  و إلا سيتم أختيار الخيار الأول',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: bj,
                  color: grey4,
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
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  decoration: inputDecorationStyle(
                    'الخيار الأول',
                    '...أدخل الخيار الأول',
                  ),
                  onChanged: (value) {
                    //  _controller.setname(value);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Radio(
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: (int? value) {
                      // setState(() {
                      //   selectedValue = value!;
                      // });
                    },
                  ),
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
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  decoration: inputDecorationStyle(
                    'الخيار الثاني',
                    '...أدخل الخيار الثاني',
                  ),
                  onChanged: (value) {
                    //  _controller.setname(value);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Radio(
                    value: 2,
                    groupValue: selectedValue,
                    onChanged: (int? value) {
                      // setState(() {
                      //   selectedValue = value!;
                      // });
                    },
                  ),
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
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  decoration: inputDecorationStyle(
                    'الخيار الثالت',
                    '...أدخل الخيار الثالت',
                  ),
                  onChanged: (value) {
                    //  _controller.setname(value);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Radio(
                    value: 3,
                    groupValue: selectedValue,
                    onChanged: (int? value) {
                      // setState(() {
                      //   selectedValue = value!;
                      // });
                    },
                  ),
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
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  decoration: inputDecorationStyle(
                    'الخيار الرابع',
                    '...أدخل الخيار الرابع',
                  ),
                  onChanged: (value) {
                    //  _controller.setname(value);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Radio(
                    value: 4,
                    groupValue: selectedValue,
                    onChanged: (int? value) {
                      // setState(() {
                      //   selectedValue = value!;
                      // });
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: purble2,
    title: Center(
      child: Text(
        'إضافة إختبار',
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: bj,
          fontWeight: FontWeight.w500,
          color: white,
        ),
      ),
    ),
    leading: IconButton(
      icon: Icon(
        AppIcons.back_icon,
        color: white,
        size: 16.sp,
      ),
      onPressed: () {
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
                      color: black,
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
                      Get.toNamed(AppPages.shome);
                    },
                    child: Container(
                      height: 6.h,
                      width: 18.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.sp,
                            color: purble2,
                          ),
                          borderRadius: BorderRadius.circular(5.sp),
                          color: purble2),
                      child: Center(
                        child: Text(
                          'رجوع',
                          maxLines: 1,
                          style: TextStyle(
                            color: white,
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
      },
    ),
    bottom: TabBar(
        indicatorColor: white,
        automaticIndicatorColorAdjustment: true,
        overlayColor: MaterialStateProperty.all(purble3),
        labelColor: white,
        unselectedLabelColor: grey2,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Text(
            'الأسئلة',
            style: TextStyle(
                color: white,
                fontFamily: bj,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp),
          ),
          Text(
            'إضافة سؤال',
            style: TextStyle(
              color: white,
              fontFamily: bj,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
        ]),
  );
}
