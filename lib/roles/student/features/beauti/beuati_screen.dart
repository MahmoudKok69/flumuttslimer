import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/beauti/beauti_components.dart';
import 'package:flumuttslimer/roles/student/features/beauti/beauti_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BeuatiScreen extends StatelessWidget {
  const BeuatiScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.builder(
        itemCount: Get.find<BeuatiController>().beuatiList.length,
        itemBuilder: (BuildContext context, int index) {
          var item = Get.find<BeuatiController>().beuatiList[index];
          return BeautiCard(
            item: item,
            index: index,
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.purble2,
      title: Center(
        child: Text(
          'الأخلاق و الجمال',
          style: TextStyle(
              fontFamily: AppFonts.bj,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
              fontSize: 16.sp),
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          size: 12.sp,
          color: AppColors.white,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
