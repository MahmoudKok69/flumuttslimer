import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/extension.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

InputDecoration inputDecorationStyle(String label, String hint) {
  return InputDecoration(
    label: Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        label,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.grey1,
          fontFamily: AppFonts.bj,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.right,
      ).arabicText(),
    ),
    hintText: hint,
    counterText: '',
    hintTextDirection: TextDirection.ltr,
    hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.grey3),
    alignLabelWithHint: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.sp),
      ),
    ),
  );
}
