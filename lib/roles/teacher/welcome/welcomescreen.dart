import 'dart:math';

import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/common.dart';
import 'package:flumuttslimer/roles/teacher/welcome/welcome_controller.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flumuttslimer/roles/teacher/new_upd_group/add_group_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _controller = Get.find<WelcomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.purble3,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  flex: 2,
                  child: FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          ' 👋 مرحباً يا صديقي ',
                          style: TextStyle(
                              color: AppColors.white,
                              fontFamily: AppFonts.bj,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          ' ما هو دورك ؟ ',
                          style: TextStyle(
                              color: AppColors.white,
                              fontFamily: AppFonts.bj,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          ' ما  هي صفتك التي تستخدمها في التطبيق؟',
                          style: TextStyle(
                              color: AppColors.white,
                              fontFamily: AppFonts.bj,
                              fontSize: 6.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 3,
                child: GetBuilder<WelcomeController>(
                  id: 'setvalue_choose',
                  init: WelcomeController(),
                  builder: (_) {
                    return Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  height: min(100.w, 100.h) / 2,
                                  width: min(100.w, 100.h) / 2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: _controller.isStudent
                                        ? Border.all(
                                            color: AppColors.purble1,
                                            width: 5.sp)
                                        : null,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/welcome_screen/student1.png'),
                                        fit: BoxFit.cover),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (!_controller.isStudent) {
                                        _controller.setvalue_choose();
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Expanded(
                                  child: Text(
                                    '🎓طالب',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontFamily: AppFonts.bj,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.sp,
                        ),
                        Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  height: min(100.w, 100.h) / 2,
                                  width: min(100.w, 100.h) / 2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: !_controller.isStudent
                                        ? Border.all(
                                            color: AppColors.purble1,
                                            width: 5.sp)
                                        : null,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/welcome_screen/teacher1.png'),
                                        fit: BoxFit.cover),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_controller.isStudent) {
                                        _controller.setvalue_choose();
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Expanded(
                                  child: Text(
                                    '📖معلم',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontFamily: AppFonts.bj,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_controller.isStudent) {
                        Get.delete<WelcomeController>();
                        Get.offAndToNamed(AppPages.shome);
                      } else {
                        Get.delete<WelcomeController>();
                        Get.offAndToNamed(AppPages.hometeacher);
                      }
                    },
                    child: BorderedContainer(
                      height: 8.h,
                      width: 30.w,
                      color: AppColors.white,
                      borderWidth: 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(AppIcons.back_icon),
                          Text(
                            'متابعة ',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: AppFonts.bj,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

// class menu extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _State();
//   }
// }

// class _State extends State<menu> {
//   var _selectedValue = 'Hawaii';
//   var _usStates = ["California", "Hawaii", "Texas"];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         PopupMenuButton<String>(
//           initialValue: _selectedValue,
//           onSelected: (String s) {
//             setState(() {
//               _selectedValue = s;
//             });
//           },
//           itemBuilder: (BuildContext context) {
//             return _usStates.map((String s) {
//               return PopupMenuItem(
//                 child: Text(s),
//                 value: s,
//               );
//             }).toList();
//           },
//           child: Icon(Icons.abc),
//         ),
//         Center(
//           heightFactor: 4,
//           child: Text(
//             _selectedValue,
//             style: TextStyle(
//               fontSize: 28.0,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class MyPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        // اكتب الكود الذي تريده هنا عند اختيار أحد الخيارات
        if (value == 'تسجيل الخروج') {
          // قم بتنفيذ عملية تسجيل الخروج
        } else if (value == 'تغيير الصورة') {
          // قم بتنفيذ عملية تغيير الصورة
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'تسجيل الخروج',
          child: Row(
            children: [
              Icon(Icons.logout),
              SizedBox(width: 8), // توسيع المسافة حسب الحاجة
              Text('تسجيل الخروج'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'تغيير الصورة',
          child: Row(
            children: [
              Icon(Icons.image),
              SizedBox(width: 8), // توسيع المسافة حسب الحاجة
              Text('تغيير الصورة'),
            ],
          ),
        ),
      ],
      child: IconButton(
        icon: Icon(Icons.person),
        onPressed: () {
          // لا شيء يجب أن يحدث عند النقر على الأيقونة
        },
      ),
    );
  }
}

// في الشاشة أو الواجهة الخاصة بك:
 // استدعاء الكلاس الذي قمت بإنشائه
