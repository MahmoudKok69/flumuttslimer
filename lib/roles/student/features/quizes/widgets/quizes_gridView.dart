import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/quiz_model.dart';
import 'package:flumuttslimer/roles/student/features/quizes/student_quizes_controller.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class QuizesGridView extends StatelessWidget {
  QuizesGridView({super.key});
  StudentQuizesController _controller = Get.find<StudentQuizesController>();

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
            color: white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 0.1.w,
              color: grey3,
            ),
            boxShadow: [
              BoxShadow(blurRadius: 3, color: black),
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
                    color: black,
                    fontSize: 18.sp,
                    fontFamily: bj,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'الأستاذ: ${item.teacher_name}',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: black,
                    fontSize: 11.sp,
                    fontFamily: bj,
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
                            color: grey2,
                            fontSize: 14.sp,
                            fontFamily: bj,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '|',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: grey2,
                            fontSize: 14.sp,
                            fontFamily: bj,
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
                                color: grey2,
                                fontSize: 14.sp,
                                fontFamily: bj,
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
