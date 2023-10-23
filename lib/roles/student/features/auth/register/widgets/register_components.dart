import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/common.dart';
import 'package:flumuttslimer/roles/student/features/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NewAccountForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _controller = Get.find<RegisterController>();

  NewAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Age Slider

          TextFormField(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            decoration: inputDecorationStyle('ما هو أسمك؟', 'أدخل أسمك'),
            onChanged: (value) {
              _controller.setName(value);
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          GetBuilder<RegisterController>(
              init: RegisterController(),
              id: 'age_field',
              builder: (_) {
                return Padding(
                  padding: EdgeInsets.all(2.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Slider(
                          divisions: 19,
                          value: _controller.age.toDouble(),
                          min: 6,
                          max: 25,
                          onChanged: (value) {
                            _controller.setAge(value.toInt());
                          },
                          label: _controller.age.toString(),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          radius: 20.sp,
                          backgroundColor: purble4,
                          child: Text(
                            '${_controller.age}',
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

          SizedBox(height: 3.h),
          // Gender Radio Buttons
          GetBuilder<RegisterController>(
              id: 'gender_field',
              init: RegisterController(),
              builder: (_) {
                return SizedBox(
                  height: 10.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (!_controller.gender) {
                              print(_controller.gender.toString());
                              _controller.setGender(true);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3.sp,
                                  color: purble2,
                                ),
                                borderRadius: BorderRadius.circular(10.sp),
                                color: _controller.gender ? purble2 : white),
                            child: Center(
                              child: Text(
                                'ذكر',
                                style: TextStyle(
                                  color: _controller.gender ? white : purble2,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (_controller.gender) {
                              print(_controller.gender.toString());
                              _controller.setGender(false);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3.sp,
                                color: purble2,
                              ),
                              borderRadius: BorderRadius.circular(10.sp),
                              color: _controller.gender ? white : purble2,
                            ),
                            child: Center(
                              child: Text(
                                'أنثى',
                                style: TextStyle(
                                  color: _controller.gender ? purble2 : white,
                                  fontSize: 25.sp,
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

          // Country Dropdown
          SizedBox(height: 3.h),
          GetBuilder<RegisterController>(
              id: 'country_field',
              init: RegisterController(),
              builder: (_) {
                return SizedBox(
                  height: 10.h,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        alignment: Alignment.centerRight,
                        dropdownColor: purble5,
                        value: _controller.country,
                        items: _controller.countries.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                value,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: purble2,
                                    fontSize: 15.sp,
                                    fontFamily: bj),
                              ));
                        }).toList(),
                        onChanged: (String? value) {
                          _controller.setCountry(value!);
                        },
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(
            height: 3.h,
          ),
          // Phone Number TextFormField
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: inputDecorationStyle('رمز دولتك', '+xxx'),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                flex: 4,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration:
                      inputDecorationStyle("رقم الهاتف", "أدخل رقم الهاتف"),
                  onChanged: (value) {
                    _controller.setPhoneNumber(value);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          // Email TextFormField
          SizedBox(
            height: 10.h,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: inputDecorationStyle(
                  'البريد الألكتروني', 'أدخل البريد الألكتروني'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onChanged: (value) {
                _controller.setPhoneNumber(value);
              },
            ),
          ),
          // Password TextFormField
          SizedBox(
            height: 2.h,
          ),
          GetBuilder<RegisterController>(
              id: 'password_filed',
              init: RegisterController(),
              builder: (_) {
                return SizedBox(
                  height: 10.h,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      prefix: IconButton(
                        icon: _controller.obscure
                            ? Icon(
                                Icons.visibility_off,
                                color: purble2,
                                size: 20.sp,
                              )
                            : Icon(
                                Icons.visibility,
                                color: purble2,
                                size: 20.sp,
                              ),
                        onPressed: () {
                          _controller.changeObscure();
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
                      _controller.setPassword(value);
                    },
                  ),
                );
              }),
          SizedBox(height: 2.0.h),
          // Confirm Password TextFormField
          SizedBox(
            height: 2.h,
          ),
          GetBuilder<RegisterController>(
              id: 'confiPassword_field',
              init: RegisterController(),
              builder: (_) {
                return SizedBox(
                  height: 10.h,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      prefix: IconButton(
                        icon: _controller.obscureConfi
                            ? Icon(
                                Icons.visibility_off,
                                color: purble2,
                                size: 20.sp,
                              )
                            : Icon(
                                Icons.visibility,
                                color: purble2,
                                size: 20.sp,
                              ),
                        onPressed: () {
                          _controller.changeObscureConfi();
                        },
                      ),
                      label: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          ' تأكيد كلمة المرور',
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
                    obscureText: _controller.obscureConfi,
                    onChanged: (value) {
                      _controller.setConfirmPassword(value);
                    },
                  ),
                );
              }),
          SizedBox(height: 2.0.h),

          SizedBox(
            width: 40.w,
            child: MaterialButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('Ok');
                  _controller.regester();
                }
              },
              color: purble2,
              child: Center(
                child: Text(
                  'إنشاء الحساب',
                  style: TextStyle(
                    color: white,
                    fontFamily: 'Bahij',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
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

class ImageSelector extends StatelessWidget {
  var avatarList = [
    'assets/images/onboard/onBoard1.png',
    'assets/images/onboard/onBoard2.png',
    'assets/images/onboard/onBoard3.png',
    'assets/images/onboard/onBoard4.png',
    'assets/images/onboard/onBoard5.png',
  ];
  final ScrollController _imageScrollController = ScrollController();
  final _controller = Get.find<RegisterController>();

  ImageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h, // Adjust the height as needed
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Center(
                child: GestureDetector(
                  child: Center(
                    child: CircleAvatar(
                      radius: 60.sp,
                      backgroundColor: purble4,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: purble2,
                              size: 25.sp,
                            ),
                            Text('أختر صورة',
                                style: TextStyle(
                                  color: purble2,
                                  fontSize: 12.sp,
                                  fontFamily: bj,
                                  fontWeight: FontWeight.w500,
                                ))
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SizedBox(
              // width: 70.w,
              // height: 30.h,
              child: ListView.builder(
                controller: _imageScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: avatarList.length, // Provide a list of avatar images
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle avatar selection
                      _controller.image = avatarList[index];
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(avatarList[index]),
                        radius: 50.sp,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
