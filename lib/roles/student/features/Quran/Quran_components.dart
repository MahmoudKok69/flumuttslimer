import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran_controller.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class QuranBody extends StatelessWidget {
  final _controller = Get.find<QuranController>();

  QuranBody({super.key});
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
  final _controller = Get.find<QuranController>();

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
            child: PhysicalModel(
              elevation: 5,
              color: white,
              borderRadius: BorderRadius.circular(5.sp),
              child: ListTile(
                visualDensity: const VisualDensity(vertical: 3),
                shape: BeveledRectangleBorder(
                  side: BorderSide(width: 0.05.w),
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                leading: Container(
                  height: 35.sp,
                  width: 35.sp,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Quran[index]['type_en'] == 'meccan'
                          ? const AssetImage('assets/images/sorah/mka.png')
                          : const AssetImage('assets/images/sorah/mdn.png'),
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                onTap: () {
                  Get.toNamed(AppPages.sorah, parameters: {
                    'number': '$index',
                  });
                },
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
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuranEvents extends StatelessWidget {
  QuranEvents({super.key});
  final _controller = Get.find<QuranController>();
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
    return PhysicalModel(
      elevation: 5,
      color: white,
      borderRadius: BorderRadius.circular(5.sp),
      child: ListTile(
        shape: BeveledRectangleBorder(
          side: BorderSide(width: 0.01.w),
          borderRadius: BorderRadius.circular(5.sp),
        ),
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
        tileColor: white,
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${item.points} نقطة',
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
      ),
    );
  }
}
