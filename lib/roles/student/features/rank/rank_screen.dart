import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/rank/rank_components.dart';
import 'package:flumuttslimer/roles/student/features/rank/rank_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RankScreen extends StatelessWidget {
  RankScreen({super.key});

  final _controller = Get.find<RankController>();
  var userInde = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.purble2, AppColors.purble3],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.sp),
                  bottomRight: Radius.circular(10.sp),
                ),
              ),
              child: Column(
                children: [
                  RankUpSection(
                    title: '',
                  ),
                  FirstThreeUser(),
                ],
              ),
            ),
            ..._controller.users.skip(3).map((user) {
              userInde++;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.4),
                        blurRadius: 1,
                        offset: const Offset(2, 3),
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      tileColor: AppColors.white,
                      style: ListTileStyle.list,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.purble1),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    '$userInde',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.orange1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                user.name!,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontFamily: AppFonts.bj,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'العمر : ${user.age.toString()}',
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontFamily: AppFonts.bj,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'عدد النقاط :${user.points.toString()}',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontFamily: AppFonts.bj,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'اسم المعلم: ${user.teacherName!}',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontFamily: AppFonts.bj,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 100.sp,
                              width: 100.sp,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.purble4),
                            ),
                          ),
                        ],
                      )),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class RankUpSection extends StatelessWidget {
  RankUpSection({
    super.key,
    this.title,
  });
  String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.white,
                size: 12.sp,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          CustomSwitcher(),
        ],
      ),
    );
  }
}

class CustomSwitcher extends StatelessWidget {
  CustomSwitcher({super.key});
  RankController _controller = Get.find<RankController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: GetBuilder(
              id: 'select_filter',
              init: RankController(),
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_controller.filters.length, (index) {
                    int selectedIndex = _controller.selectedFilter;
                    List<String> filters = _controller.filters;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: InkWell(
                        onTap: () {
                          _controller.selectFilter(index);
                        },
                        child: Transform.scale(
                          scale: selectedIndex == index ? 1.05 : 1,
                          child: Container(
                            width: 20.w,
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? AppColors.orange1
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 1.h),
                              child: Center(
                                child: ArabicText(
                                  text: filters[index],
                                  color: selectedIndex == index
                                      ? AppColors.white
                                      : AppColors.purble3,
                                  fontSize:
                                      selectedIndex == index ? 12.sp : 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              })),
    );
  }
}

// class CustomSwitcher extends StatefulWidget {
//   const CustomSwitcher({super.key});

//   @override
//   State<CustomSwitcher> createState() => _CustomSwitcherState();
// }

// class _CustomSwitcherState extends State<CustomSwitcher> {
//   var isEnable = false;
//   final animationDuration = const Duration(milliseconds: 200);
//   var _alignmentController;
//   final _alignments = [
//     Alignment.centerLeft,
//     Alignment.centerRight,
//   ];
//   var alignIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       height: 5.h,
//       width: 18.w,
//       decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(20.sp),
//           border: Border.all(color: AppColors.white, width: 1.sp),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.grey.shade400, spreadRadius: 2, blurRadius: 10)
//           ]),
//       duration: animationDuration,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 1.w),
//         child: Stack(
//           children: [
//             AnimatedAlign(
//               alignment: _alignments[alignIndex],
//               duration: animationDuration,
//               child: Container(
//                 height: 5.h,
//                 width: 8.w,
//                 decoration: BoxDecoration(
//                     color: AppColors.purble4.withOpacity(0.7), shape: BoxShape.circle),
//               ),
//             ),
//             SizedBox(
//               height: 5.h,
//               width: 18.w,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: IconButton(
//                       padding: const EdgeInsets.all(0),
//                       hoverColor: AppColors.white.withOpacity(0),
//                       icon: Center(
//                         child: Icon(
//                           Icons.group,
//                           color: AppColors.purble2,
//                           size: 12.sp,
//                         ),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           alignIndex = 0;
//                         });
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: IconButton(
//                       hoverColor: AppColors.white.withOpacity(0),
//                       padding: const EdgeInsets.all(0),
//                       icon: Center(
//                         child: Icon(
//                           Icons.public_rounded,
//                           color: AppColors.purble2,
//                           size: 15.sp,
//                         ),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           alignIndex = 1;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
