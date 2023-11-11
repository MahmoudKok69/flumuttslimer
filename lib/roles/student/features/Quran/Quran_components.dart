import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_controller.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';

class QuranBody extends StatelessWidget {
  var _controller = Get.find<QuranController>();
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        QuranEvents(),
        TheQuran(),
      ],
    );
  }
}

class TheQuran extends StatelessWidget {
  TheQuran({super.key});
  var _controller = Get.find<QuranController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: ListView.builder(
        itemCount: _controller.alSour.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _controller.alSour[index];
          return Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: ListTile(
              visualDensity: const VisualDensity(vertical: 3),
              leading: Container(
                height: 35.sp,
                width: 35.sp,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Quran[index]['type_en'] == 'meccan'
                        ? AssetImage('assets/images/sorah/mka.png')
                        : AssetImage('assets/images/sorah/mdn.png'),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                Get.toNamed(AppPages.sorah, parameters: {
                  'number': '$index',
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.sp)),
              title: Text(
                '${index + 1}- ${item!}',
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: black,
                    fontFamily: um,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              tileColor: purble5,
            ),
          );
        },
      ),
    );
  }
}

class QuranEvents extends StatelessWidget {
  QuranEvents({super.key});
  var _controller = Get.find<QuranController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: ListView.builder(
        itemCount: _controller.events.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _controller.events[index];
          return Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: GetBuilder<QuranController>(
                init: QuranController(),
                builder: (_) {
                  return QuranEventCard(
                    item: item,
                  );
                },
              ));
        },
      ),
    );
  }
}

class QuranEventCard extends StatelessWidget {
  const QuranEventCard({super.key, this.item});
  final item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.sp)),
      title: Padding(
        padding: EdgeInsets.only(bottom: 8.0.sp),
        child: Text(
          item.name!,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: black,
            fontFamily: bj,
            fontSize: 14.sp,
          ),
        ),
      ),
      tileColor: purble4.withOpacity(0.8),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            item.points.toString(),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: purble1,
              fontFamily: bj,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: CircleAvatar(radius: 2.sp, backgroundColor: black),
          ),
          Text(
            '${item.date!.year}/${item.date!.month}/${item.date!.day}',
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: purble1,
              fontFamily: bj,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: CircleAvatar(radius: 2.sp, backgroundColor: black),
          ),
          Text(
            item.teacherName!,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: purble1,
              fontFamily: bj,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
