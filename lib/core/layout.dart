import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

buildAppBar(
    {required text,
    required leadingIcon,
    required actionIcon,
    required onTapLeadingIcon,
    required onTapActionIcon}) {
  return AppBar(
    backgroundColor: purble2,
    title: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: bj,
          fontWeight: FontWeight.w500,
          color: white,
        ),
      ),
    ),
    leading: IconButton(
        icon: Icon(
          leadingIcon,
          color: white,
          size: 16.sp,
        ),
        onPressed: onTapLeadingIcon),
    actions: [
      IconButton(
          onPressed: onTapActionIcon,
          icon: Icon(
            actionIcon,
            color: white,
            size: 16.sp,
          ))
    ],
  );
}
