import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefrencesScreen extends StatelessWidget {
  const RefrencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          text: 'المكتبة',
          leadingIcon: AppIcons.back_icon,
          actionIcon: null,
          onTapLeadingIcon: () {
            Get.back();
          },
          onTapActionIcon: null),
    );
  }
}
