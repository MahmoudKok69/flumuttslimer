import 'dart:math';

import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
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
  var _selectedValue = 'تغيير الصورة';
  var _usStates = ["تسجيل الخروج", "تغيير الصورة"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: purble3,
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
                              color: white,
                              fontFamily: bj,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          ' ما هو دورك ؟ ',
                          style: TextStyle(
                              color: white,
                              fontFamily: bj,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          ' ما  هي صفتك التي تستخدمها في التطبيق',
                          style: TextStyle(
                              color: white,
                              fontFamily: bj,
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
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 230.sp,
                          width: 140.sp,
                          decoration: BoxDecoration(
                            border: _controller.isStudent ? Border.all() : null,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (_controller.isTeacher) {
                                _controller.setvalue_choose();
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: const AssetImage(
                                            'assets/images/student.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Expanded(
                                  child: Text(
                                    '🎓طالب',
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: bj,
                                        fontSize: 14.sp,
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
                        Container(
                          height: 230.sp,
                          width: 140.sp,
                          decoration: BoxDecoration(
                            border: _controller.isTeacher ? Border.all() : null,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (_controller.isStudent) {
                                _controller.setvalue_choose();
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: const AssetImage(
                                            'assets/images/tecaher.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Expanded(
                                  child: Text(
                                    '📖معلم',
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: bj,
                                        fontSize: 14.sp,
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
                height: 15,
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_controller.isStudent) {
                        Get.toNamed(AppPages.shome);
                      }
                      if (_controller.isTeacher) {
                        Get.toNamed(AppPages.hometeacher);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: 8.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: white,
                        border: Border.all(
                          width: 1.sp,
                          color: purble2,
                        ),
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Text(
                            'متابعة ',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Bahij',
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
