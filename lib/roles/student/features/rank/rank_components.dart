import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/rank/rank_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FirstThreeUser extends StatelessWidget {
  final _controller = Get.find<RankController>();

  FirstThreeUser({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.h,
      width: Get.size.width,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: [
          FirstUser(
            name: _controller.users[0].name,
            points: _controller.users[0].points,
            image: '',
          ),
          OtherUser(
            name: _controller.users[1].name,
            points: _controller.users[1].points,
            image: '',
            number: 2,
            align: Alignment.bottomRight,
          ),
          OtherUser(
            name: _controller.users[2].name,
            points: _controller.users[2].points,
            image: '',
            number: 3,
            align: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}

class FirstUser extends StatelessWidget {
  const FirstUser({super.key, this.image, this.name, this.points});
  final name;
  final image;
  final points;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 60.h,
        width: 40.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                child: Image.asset(
                  'assets/images/gifs/crown.gif',
                  fit: BoxFit.cover,
                  width: 35.w,
                  height: 12.h,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                name!,
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: AppFonts.bj,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                height: 20.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 60.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: AppColors.orange1,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 12.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.green.shade500,
                              width: 4,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            )),
                        child: Center(
                            child: Text(
                          '1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.purble2,
                              fontSize: 14.sp,
                              fontFamily: AppFonts.bj,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                points.toString(),
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: AppFonts.bj,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtherUser extends StatelessWidget {
  const OtherUser(
      {super.key, this.image, this.name, this.number, this.points, this.align});
  final name;
  final image;
  final points;
  final number;
  final align;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.sp),
      child: Align(
        alignment: align,
        child: SizedBox(
          height: 30.h,
          width: 20.w,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  name!,
                  style: TextStyle(
                    color: AppColors.white,
                    fontFamily: AppFonts.bj,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 14.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 40.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 8.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.green.shade500,
                                width: 4,
                                strokeAlign: BorderSide.strokeAlignOutside,
                              )),
                          child: Center(
                              child: Text(
                            number.toString(),
                            style: TextStyle(
                                color: AppColors.purble2,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.bj),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  points.toString(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontFamily: AppFonts.bj,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
