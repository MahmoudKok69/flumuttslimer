import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/common.dart';
import 'package:flumuttslimer/roles/student/features/auth/login/login_controller.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NewAccountPhase extends StatelessWidget {
  const NewAccountPhase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'ليس لديك حساب ؟ ',
            style: TextStyle(
                color: black,
                fontFamily: bj,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: 'إنشاء حساب جديد',
            style: TextStyle(
                color: purble2,
                fontFamily: bj,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed(AppPages.sregister);
              },
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _controller = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  LoginForm({super.key});

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
                  height: 1.h,
                ),
                GetBuilder<LoginController>(
                  id: 'password_field',
                  init: LoginController(),
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
                                    color: purble2,
                                    size: 14.sp,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: purble2,
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
                                color: purble1,
                                fontFamily: 'Bahij',
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          hintText: 'أدخل كلمة المرور',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(
                            color: purble1,
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
                SizedBox(height: 2.0.h),
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
                        backgroundColor: MaterialStateProperty.all(purble2)),
                    child: Center(
                      child: Text(
                        'تسجيل الدخول',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UpImage extends StatelessWidget {
  const UpImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0.h,
      width: Get.size.width,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(10.sp),
        //   bottomRight: Radius.circular(10.sp),
        // ),
        color: purble2,
      ),
      child: Image.asset(
        'assets/images/login.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
