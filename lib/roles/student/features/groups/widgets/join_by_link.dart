import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/groups/groups_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<dynamic> joinGroubByLinkDialog() {
  return Get.defaultDialog(
    title: 'الأنضمام عن طريق الرابط',
    titleStyle: TextStyle(
        color: black,
        fontSize: 18.sp,
        fontFamily: bj,
        fontWeight: FontWeight.bold),
    content: SizedBox(
      width: 80.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AddGroubLinkField(),
          SizedBox(height: 3.h),
          WarningPhase(),
          SizedBox(height: 3.h),
          JoinButton()
        ],
      ),
    ),
  );
}

class JoinButton extends StatelessWidget {
  const JoinButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      decoration: BoxDecoration(
          color: purble3, borderRadius: BorderRadius.circular(5.sp)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ArabicText(
              text: 'أنضمام',
              color: white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            Icon(
              Icons.add,
              color: white,
              size: 18.sp,
            )
          ],
        ),
      ),
    );
  }
}

class WarningPhase extends StatelessWidget {
  const WarningPhase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ArabicText(
      text:
          'في حال الأنضمام لهذه المجموعة فسيتم أخراجك من مجموعتك الحالية في حال كنت منضم لمجموعة',
      color: grey2,
      fontSize: 12.sp,
      maxLine: 5,
      fontWeight: FontWeight.w400,
    );
  }
}

class AddGroubLinkField extends StatelessWidget {
  const AddGroubLinkField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50.w,
            height: 7.h,
            child: TextField(
              controller: Get.find<SGroupsController>().groubLinkController,
              maxLength: 8,
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                  counterText: '',
                  label: ArabicText(text: 'أدخل رابط المجموعة'),
                  labelStyle: TextStyle(
                      color: grey2,
                      fontFamily: bj,
                      fontWeight: FontWeight.w300),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.sp),
                          bottomRight: Radius.circular(5.sp)),
                      borderSide: BorderSide(color: purble3, width: 2.0.w))),
            ),
          ),
          InkWell(
            onTap: () async {
              await Clipboard.getData(Clipboard.kTextPlain).then((value) {
                Get.find<SGroupsController>().groubLinkController.text =
                    value!.text!.substring(0, 8);
              });
            },
            child: Container(
              width: 15.w,
              height: 7.h,
              decoration: BoxDecoration(
                color: purble3,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.sp),
                    bottomLeft: Radius.circular(5.sp)),
              ),
              child: Icon(
                Icons.paste,
                color: white,
                size: 18.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
