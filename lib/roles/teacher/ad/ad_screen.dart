import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/common.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/Azkar_components.dart';
import 'package:flumuttslimer/roles/student/features/beauti/beauti_components.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flumuttslimer/roles/teacher/ad/ad_controller.dart';
import 'package:flumuttslimer/roles/teacher/my_group/my_group_controller.dart';
import 'package:flumuttslimer/roles/teacher/my_group/widgets/my_group_components.dart';
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'الإعلان',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: bj,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        TextFormField(
                          maxLines: 5,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          decoration: inputDecorationStyle(
                              'الإعلان', ' ......أكتب إعلانك'),
                          onChanged: (value) {
                            _controller.settextad(value);
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'الفئة المستلمة',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: bj,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                            height: 30.h,
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
                              child: ListView(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('الكل'),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      CustomCheckBox(
                                        height: 12.sp,
                                        width: 12.sp,
                                        selectColor: purble2,
                                        unselectColor: purble5,
                                        iconColor: white,
                                        borderRadius: 1.sp,
                                        isChecked: true,
                                        iconSize: 12.sp,
                                        onchange: () {
                                          //_controller.checkAzkar(index);
                                        },
                                      ),
                                    ],
                                  ),
                                  ..._controller.groups.map((e) {
                                    userInde++;
                                    return Container();
                                  })
                                ],
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
                                Get.toNamed(AppPages.shome);

                                if (_formKey.currentState!.validate()) {
                                  print('Ok');
                                  // _controller.regeste();
                                  // Get.toNamed(AppPages.shome);
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(purble2),
                              ),
                              child: Center(
                                child: Text(
                                  ' إرسال',
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
                        )
                      ])),
            ),
          ],
        ));
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: purble2,
    title: Center(
      child: Text(
        'إضافة إعلان',
        style: TextStyle(
            fontFamily: bj,
            fontWeight: FontWeight.w500,
            color: white,
            fontSize: 16.sp),
      ),
    ),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        size: 12.sp,
        color: white,
      ),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
