import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/extension.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/common.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/Azkar_components.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flumuttslimer/roles/teacher/ad/ad_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AdScreen extends StatelessWidget {
  AdScreen(
      {super.key,
      this.categ,
      this.count_students,
      this.name_institute,
      this.name_group});
  String? categ;
  int? count_students;
  String? name_institute;
  String? name_group;
  var data = Get.parameters;
  final _controller = Get.find<Ad_Controller>();
  final _formKey = GlobalKey<FormState>();
  var userInde = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: _formKey,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  'الإعلان',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: AppFonts.bj,
                    fontWeight: FontWeight.w500,
                  ),
                ).arabicText(),
                SizedBox(height: 2.h),
                TextFormField(
                  maxLines: 5,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: AppColors.grey1,
                      fontFamily: AppFonts.bj,
                      fontSize: 14.sp),
                  decoration: inputDecorationStyle(
                      'قم بكتابة الإعلان', ' ......أكتب إعلانك'),
                  onChanged: (value) {
                    _controller.settextad(value);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'الكل',
                          style: TextStyle(
                            fontFamily: AppFonts.bj,
                            fontSize: 15.sp,
                          ),
                        ).arabicText(),
                        SizedBox(
                          width: 3.w,
                        ),
                        GetBuilder<Ad_Controller>(
                          id: 'checked_all_groups',
                          init: Ad_Controller(),
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
                SizedBox(height: 2.h),
                Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.sp),
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
                              child: GetBuilder<Ad_Controller>(
                                id: 'group_check',
                                init: Ad_Controller(),
                                builder: (_) {
                                  return PhysicalModel(
                                    elevation: 5,
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(5.sp),
                                    child: ListTile(
                                      shape: BeveledRectangleBorder(
                                        side: BorderSide(width: 0.01.w),
                                        borderRadius:
                                            BorderRadius.circular(5.sp),
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
                SizedBox(
                  height: 4.h,
                ),
                Center(
                  child: SizedBox(
                    width: 70.w,
                    height: 6.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'تم إضافة الإعلان بنجاح ',
                          content: StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'بارك الله جهودك أستاذ فلان',
                                    style: TextStyle(
                                        color: AppColors.grey1,
                                        fontSize: 16.sp,
                                        fontFamily: AppFonts.bj),
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
                                            color: AppColors.purble2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.sp),
                                          color: AppColors.purble2),
                                      child: Center(
                                        child: Text(
                                          'إغلاق',
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 10.sp,
                                            fontFamily: AppFonts.bj,
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
                        if (_formKey.currentState!.validate()) {
                          print('Ok');
                          // _controller.regeste();
                          // Get.toNamed(AppPages.shome);
                        }
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
                            fontFamily: AppFonts.bj,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ])),
        ));
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: AppColors.purble2,
    title: Center(
      child: Text(
        'إضافة إعلان',
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontFamily: AppFonts.bj,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            fontSize: 16.sp),
      ),
    ),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        size: 12.sp,
        color: AppColors.white,
      ),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
