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
          color: purble1,
          fontFamily: 'Bahij',
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.right,
      ),
    ),
    hintText: hint,
    alignLabelWithHint: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.sp),
      ),
    ),
  );
}
