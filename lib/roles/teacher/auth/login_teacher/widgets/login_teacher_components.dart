import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/roles/student/common.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flumuttslimer/roles/teacher/auth/login_teacher/login_teacher_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class welcome extends StatelessWidget {
  const welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/home/Quran.png'),
                        fit: BoxFit.contain)),
              ),
              Text(
                "مرحباً بعودتك",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            "! تابع رحلتك التنافسية في الطاعات مع تلاميذتك ",
            style: TextStyle(fontSize: 10.sp),
          ),
        ),
      ],
    );
  }
}

class Login_teacherForm extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _controller = Get.find<Login_teacher_Controller>();
  final _formKey = GlobalKey<FormState>();

  Login_teacherForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.0.h),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                  child: TextFormField(
                    controller: email,
                    textAlign: TextAlign.right,
                    decoration: inputDecorationStyle(
                        'البريد الألكتروني', 'أدخل البريد الألكتروني'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'رجاءً أدخل بريدك الألكتروني';
                      }
                      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                          .hasMatch(value)) {
                        return 'هذا البريد غير صالح';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _controller.email = email.text;
                    },
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                GetBuilder<Login_teacher_Controller>(
                  id: 'password_field',
                  init: Login_teacher_Controller(),
                  builder: (_) {
                    return SizedBox(
                      height: 10.h,
                      child: TextFormField(
                        controller: password,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          prefix: IconButton(
                            icon: _controller.obscure
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColors.purble2,
                                    size: 14.sp,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: AppColors.purble2,
                                    size: 14.sp,
                                  ),
                            onPressed: () {
                              _controller.changObscure();
                            },
                          ),
                          label: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'كلمة المرور',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: AppColors.purble1,
                                fontFamily: 'Bahij',
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          hintText: 'أدخل كلمة المرور',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(
                            color: AppColors.purble1,
                            fontFamily: 'Bahij',
                            fontWeight: FontWeight.w300,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.sp),
                            ),
                          ),
                        ),
                        obscureText: _controller.obscure,
                        onChanged: (value) {
                          _controller.password = password.text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'رجاء أدخل كلمة المرور';
                          }
                          if (value.length < 8) {
                            return 'كلمة المرور يجب أن تكون 8 محارف على الأقل';
                          }
                          return null;
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 4.0.h),
                SizedBox(
                  width: 40.w,
                  height: 5.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppPages.shome);
                      if (_formKey.currentState!.validate()) {
                        print('is valid');
                        _controller.login();
                        // Get.toNamed(AppPages.shome);
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.purble2)),
                    child: Center(
                      child: Text(
                        'تسجيل الدخول',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
