import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/extension.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/my_quiz_model.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/quiz_model.dart';
import 'package:flumuttslimer/roles/student/features/quizes/student_quizes_controller.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class QuizBody extends StatelessWidget {
  QuizBody({super.key});
  StudentQuizesController _controller = Get.find<StudentQuizesController>();

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      AllQuizes(controller: _controller),
      MyQuizes(controller: _controller),
    ]);
  }
}

class MyQuizes extends StatelessWidget {
  const MyQuizes({
    super.key,
    required StudentQuizesController controller,
  }) : _controller = controller;

  final StudentQuizesController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Get.size.width > 500 ? 3 : 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: _controller.my_quizes.length,
          itemBuilder: (context, index) {
            MyQuizModel item = _controller.my_quizes[index];
            return GridItem(
              title: item.quiz_name!,
              middleText: item.teacher_name!,
              subtitle: item.result.toString(),
            );
          },
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String middleText;

  GridItem({
    required this.title,
    required this.subtitle,
    required this.middleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: Colors.grey, width: 0.1),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [BoxShadow(color: AppColors.black, blurRadius: 2)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ArabicText(
            text: title,
            color: AppColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 8.0),
          ArabicText(
            text: middleText,
            color: AppColors.purble2,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArabicText(
                text: 'النتيجة: $subtitle',
                color: AppColors.grey2,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(width: 4.0),
              const PointIcon(),
            ],
          ).rightDirction(),
        ],
      ).rightDirction(),
    );
  }
}

class AllQuizes extends StatelessWidget {
  const AllQuizes({
    super.key,
    required StudentQuizesController controller,
  }) : _controller = controller;

  final StudentQuizesController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: GetBuilder<StudentQuizesController>(
            id: 'finish_quiz',
            init: StudentQuizesController(),
            builder: (_) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2.h,
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.w,
                ),
                itemCount: _controller.quizes.length,
                itemBuilder: (BuildContext context, int index) {
                  QuizModel item = _controller.quizes[index];
                  return QuizCard(
                    item: item,
                    index: index,
                  );
                },
              );
            },
          )),
    );
  }
}

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.item,
    required this.index,
  });

  final QuizModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppPages.squizstart, parameters: {
          'index': index.toString(),
        });
      },
      child: Container(
        width: 46.w,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 0.1.w,
              color: AppColors.grey3,
            ),
            boxShadow: [
              BoxShadow(blurRadius: 3, color: AppColors.black),
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.title!,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18.sp,
                    fontFamily: AppFonts.bj,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'الأستاذ: ${item.teacher_name}',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 11.sp,
                    fontFamily: AppFonts.bj,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 40.w,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${item.questions!.length} سؤال',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: AppColors.grey2,
                            fontSize: 14.sp,
                            fontFamily: AppFonts.bj,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '|',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: AppColors.grey2,
                            fontSize: 14.sp,
                            fontFamily: AppFonts.bj,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${item.points}',
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: AppColors.grey2,
                                fontSize: 14.sp,
                                fontFamily: AppFonts.bj,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const PointIcon(),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
