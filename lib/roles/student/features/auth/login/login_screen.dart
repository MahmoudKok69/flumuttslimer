
import 'package:flumuttslimer/roles/student/features/auth/login/widgets/screen_components.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('its rebuild everything');
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UpImage(),
          SizedBox(height: 10.h),
          LoginForm(),
          const Spacer(),
          const NewAccountPhase(),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
