import 'package:flumuttslimer/roles/student/features/auth/login/widgets/screen_components.dart';
import 'package:flumuttslimer/roles/teacher/auth/login_teacher/widgets/login_teacher_components.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Login_teacherScreen extends StatelessWidget {
  const Login_teacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('its rebuild everything');
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              welcome(),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Login_teacherForm(),
          // const UpImage(),
          // SizedBox(height: 10.h),

          // const Spacer(),
          // const NewAccountPhase(),
          // SizedBox(
          //   height: 5.h,
          // )
        ],
      ),
    );
  }
}
