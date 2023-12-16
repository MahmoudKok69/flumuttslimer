import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/roles/student/features/auth/register/widgets/register_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/font_family.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Buil whole register');
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(2.0.h),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: NewAccountForm(),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(AppIcons.back_icon, color: AppColors.white),
        onPressed: () {
          Get.back();
        },
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'إنشاء حساب جديد',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppColors.white,
            fontFamily: AppFonts.bj,
          ),
        ),
      ),
      backgroundColor: AppColors.purble2,
    );
  }
}
