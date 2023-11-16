
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/groups/groups_controller.dart';
import 'package:flumuttslimer/roles/student/features/groups/models/groups_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SGroupsBody extends StatelessWidget {
  SGroupsBody({
    super.key,
  });

  final _controller = Get.find<SGroupsController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _controller.groups.length,
      itemBuilder: (BuildContext context, int index) {
        var item = _controller.groups[index];
        return SGroupCard(item: item);
      },
    );
  }
}

class SGroupCard extends StatelessWidget {
  const SGroupCard({super.key, required this.item});

  final item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 96.w,
          height: 15.h,
          decoration: BoxDecoration(
              border: Border.all(color: black, width: 0.01.w),
              color: white,
              borderRadius: BorderRadius.circular(5.sp),
              boxShadow: [
                BoxShadow(
                  color: black,
                  blurRadius: 1,
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(
                flex: 1,
              ),
              InkWell(
                  onTap: item.isAvailable!
                      ? () {
                          lastCheckDialog(item);
                        }
                      : null,
                  child: Container(
                    width: 25.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: item.isAvailable! ? purble3 : grey2,
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    child: Center(
                        child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: white,
                          ),
                          Text(
                            'إنضمام',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontFamily: bj,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    )),
                  )),
              const Spacer(
                flex: 5,
              ),
              FittedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        item.name!,
                        style: TextStyle(
                          color: grey1,
                          fontFamily: bj,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                        'عدد الطلاب: ${item.maxNumber}/${item.number}',
                        style: TextStyle(
                          color: grey1,
                          fontFamily: bj,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                        'المعلم: ${item.teacher_name}',
                        style: TextStyle(
                          color: grey1,
                          fontFamily: bj,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        )
      ],
    );
  }
}

lastCheckDialog(SGroupCardModel item) {
  return Get.defaultDialog(
      title: item.name!,
      titleStyle: TextStyle(
        color: grey1,
        fontFamily: bj,
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
      ),
      backgroundColor: white,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 20.h,
            width: 60.w,
            child: Text(
              item.description!,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: TextStyle(
                color: grey2,
                fontFamily: bj,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'المعلم: ${item.teacher_name!}',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
            style: TextStyle(
              color: grey2,
              fontFamily: bj,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'في حال الأنضمام لهذه المجموعة فسيتم أخراجك من مجموعتك الحالية في حال كنت منضم لمجموعة',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
            style: TextStyle(
              color: grey3,
              fontFamily: bj,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,
            ),
          ),
          SizedBox(height: 1.2.h),
          InkWell(
            onTap: () {},
            child: Container(
              height: 5.h,
              decoration: BoxDecoration(
                color: purble3,
                borderRadius: BorderRadius.circular(5.sp),
              ),
              child: Center(
                  child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: white,
                    ),
                    Text(
                      'إنضمام',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontFamily: bj,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ),
        ],
      ));
}
