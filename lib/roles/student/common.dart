import 'package:flumuttslimer/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

InputDecoration inputDecorationStyle(String label, String hint) {
  return InputDecoration(
    label: Directionality(
      textDirection: TextDirection.ltr,
      child: Text(
        label,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 12.sp,
          color: purble1,
          fontFamily: 'Bahij',
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.right,
      ),
    ),
    hintText: hint,
    hintStyle: TextStyle(
      fontSize: 6.sp,
      color: grey,
    ),
    alignLabelWithHint: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.sp),
      ),
    ),
  );
}
