import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

buildAppBar(
    {required text,
    required leadingIcon,
    required actionIcon,
    required onTapLeadingIcon,
    required onTapActionIcon,
    bottom}) {
  return AppBar(
    backgroundColor: purble2,
    bottom: bottom,
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

class ArabicText extends StatelessWidget {
  ArabicText(
      {super.key,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.fontdecortion,
      this.maxLine,
      this.text});
  final text;
  final color;
  final fontSize;
  final fontWeight;
  final fontdecortion;
  final maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine ?? 1,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: bj,
      ),
    );
  }
}

class BorderedContainer extends StatelessWidget {
  BorderedContainer({
    super.key,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.child,
    this.color,
    this.height,
    this.width,
  });
  final width;
  final height;
  final child;
  final color;
  final borderColor;
  final borderWidth;
  final borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color ?? white,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.sp),
          border: Border.all(
            width: borderWidth ?? 0.1.w,
            color: borderColor ?? grey4,
          ),
          boxShadow: [
            BoxShadow(color: black, blurRadius: 2, offset: const Offset(-1, 1)),
            BoxShadow(
                color: black, blurRadius: 1, offset: const Offset(0.2, -0.2))
          ]),
      child: child,
    );
  }
}

class PointIcon extends StatelessWidget {
  const PointIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/point.svg',
      width: 15.sp,
      height: 15.sp,
    );
  }
}

class SvgIcon extends StatelessWidget {
  final String iconTitle;
  final Color? color;
  final double? h;
  final double? w;
  final bool isDierctional;

  const SvgIcon({
    super.key,
    required this.iconTitle,
    this.color,
    this.h,
    this.w,
    this.isDierctional = true,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconTitle,
      height: h,
      width: w,
      matchTextDirection: isDierctional,
      color: color,
    );
  }
}
