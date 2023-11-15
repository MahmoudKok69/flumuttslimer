import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/news/news_componets.dart';
import 'package:flumuttslimer/roles/student/features/news/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});
  var _controller = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
            text: 'الإعلانات',
            leadingIcon: AppIcons.back_icon,
            actionIcon: null,
            onTapLeadingIcon: () {
              Get.back();
            },
            onTapActionIcon: null),
        body: NewsBody());
  }
}
