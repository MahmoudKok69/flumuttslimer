import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/common.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flumuttslimer/roles/teacher/new_upd_group/add_group_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UpdateGroupScreen extends StatelessWidget {
  UpdateGroupScreen({super.key});
  final _controller = Get.find<AddGroupController>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController categ = TextEditingController();
  TextEditingController count_students = TextEditingController();
  TextEditingController name_institute = TextEditingController();
  TextEditingController name_group = TextEditingController();
  TextEditingController invite_url = TextEditingController();
  TextEditingController max_members = TextEditingController();
  TextEditingController isPrivate = TextEditingController();
  TextEditingController isAvailable = TextEditingController();
  final data = Get.arguments;
  @override
  void initState() {
    categ.text = data.categ;
    count_students.text = data.count_students;
    name_institute.text = data.name_institute;
    name_group.text = data.name_group;
    invite_url.text = data.invite_url;
    max_members.text = data.max_members;
    isPrivate.text = data.isPrivate;
    isAvailable.text = data.isAvailable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'الإسم',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: bj,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        TextFormField(
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          decoration: inputDecorationStyle(
                              'إسم المجموعة', ' أدخل إسم المجموعة '),
                          onChanged: (value) {
                            _controller.setname(value);
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'الوصف',
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
                              'وصف المجموعة', ' ...... أدخل وصف المجموعة'),
                          onChanged: (value) {
                            _controller.setdescription(value);
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'توليد رابط جديد',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: bj,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.replay,
                                color: purble3,
                              ),
                              onPressed: () {
                                print(data);

                                _controller.new_url();
                              },
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: purble2,
                                borderRadius: BorderRadius.circular(5.sp),
                              ),
                              margin: const EdgeInsets.only(right: 5),
                              child: IconButton(
                                icon: Icon(
                                  Icons.content_copy,
                                  color: white,
                                ),
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: invite_url.text));

                                  Get.showSnackbar(GetSnackBar(
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: white,
                                    snackStyle: SnackStyle.GROUNDED,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 3.w),
                                    boxShadows: [
                                      BoxShadow(color: black, blurRadius: 5)
                                    ],
                                    animationDuration:
                                        const Duration(milliseconds: 500),
                                    messageText: Text(
                                      'تم نسخ النص',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: grey1,
                                        fontFamily: bj,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ));
                                },
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: invite_url,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'www.hhyy.com',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                decoration: inputDecorationStyle('العدد', ''),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ], // يقبل أرقام فقط
                                keyboardType: TextInputType
                                    .number, // يظهر لوحة مفاتيح أعداد
                                onChanged: (value) {
                                  int parsedValue = int.tryParse(value) ?? 0;
                                  _controller.setmax_members(parsedValue);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              flex: 3,
                              child: RichText(
                                textAlign: TextAlign.end,
                                text: const TextSpan(
                                  text: 'تغيير العدد الأعظمي',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '\nالعدد الأعظمي لأعضاء المجموعة',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ' نوع المجموعة ',
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: bj,
                              ),
                            ),
                            Text(
                              'نوع المجموعة يحدد في ما إذا كان الطالب قادر على الدخول إلى هذه المجموعة بدون رابط دخول  , في حال كانت المجموعة عامة ستظهر لجميع الطلاب  في التطبيق . ',
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: bj,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            GetBuilder<AddGroupController>(
                                id: 'isPrivate_field',
                                init: AddGroupController(),
                                builder: (_) {
                                  return SizedBox(
                                    height: 10.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (!_controller.isPrivate) {
                                                print(_controller.isPrivate
                                                    .toString());
                                                _controller.setisPrivate(true);
                                              }
                                            },
                                            child: Container(
                                              height: 6.h,
                                              width: 10.w,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1.sp,
                                                    color: purble2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                  color: _controller.isPrivate
                                                      ? purble2
                                                      : white),
                                              child: Center(
                                                child: Text(
                                                  'خاصة',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: _controller.isPrivate
                                                        ? white
                                                        : purble2,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (_controller.isPrivate) {
                                                print(_controller.isPrivate
                                                    .toString());
                                                _controller.setisPrivate(false);
                                              }
                                            },
                                            child: Container(
                                              height: 6.h,
                                              width: 15.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1.sp,
                                                  color: purble2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.sp),
                                                color: _controller.isPrivate
                                                    ? white
                                                    : purble2,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'عامة',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: _controller.isPrivate
                                                        ? purble2
                                                        : white,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ' إتاحية المجموعة ',
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: bj,
                              ),
                            ),
                            Text(
                              'إتاحية المجموعة تحدد فيما إذا كانت المجموعة تستقبل طلبات إنضمام حالياً , جعلها متاحة سيسمح للطلاب بالإنضمام مباشرة بدوم رابط أو من خلال رابط بحال كانت المجموعة خاصة',
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: bj,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            GetBuilder<AddGroupController>(
                                id: 'isAvailable_field',
                                init: AddGroupController(),
                                builder: (_) {
                                  return SizedBox(
                                    height: 10.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (!_controller.isAvailable) {
                                                _controller
                                                    .setisAvailable(true);
                                              }
                                            },
                                            child: Container(
                                              height: 6.h,
                                              width: 10.w,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1.sp,
                                                    color: purble2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                  color: _controller.isAvailable
                                                      ? purble2
                                                      : white),
                                              child: Center(
                                                child: Text(
                                                  'متاحة',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color:
                                                        _controller.isAvailable
                                                            ? white
                                                            : purble2,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (_controller.isAvailable) {
                                                _controller
                                                    .setisAvailable(false);
                                              }
                                            },
                                            child: Container(
                                              height: 6.h,
                                              width: 15.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1.sp,
                                                  color: purble2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.sp),
                                                color: _controller.isAvailable
                                                    ? white
                                                    : purble2,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'غير متاحة',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color:
                                                        _controller.isAvailable
                                                            ? purble2
                                                            : white,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Center(
                          child: SizedBox(
                            width: 70.w,
                            height: 6.h,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  print('Ok');
                                  _controller.update_info_group();
                                  Get.toNamed(AppPages.hometeacher);
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(purble2),
                              ),
                              child: Center(
                                child: Text(
                                  ' حفظ التغييرات ',
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: 'Bahij',
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]))),
          SizedBox(
            height: 8.h,
          )
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
        ' تعديل معلومات المجموعة  ',
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
