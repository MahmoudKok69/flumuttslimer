import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/quiz_model.dart';
import 'package:flumuttslimer/roles/student/features/quizes/student_quizes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class TheQuestionSection extends StatelessWidget {
  const TheQuestionSection({
    super.key,
    required this.item,
    required StudentQuizesController controller,
  }) : _controller = controller;

  final QuizModel item;
  final StudentQuizesController _controller;

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      width: Get.size.width * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
        child: ArabicText(
          text: item.questions![_controller.currentQuestion].label,
          fontSize: 14.sp,
          color: grey1,
        ),
      ),
    );
  }
}

class NumberOfQuestion extends StatelessWidget {
  NumberOfQuestion({
    super.key,
    required this.quizIndex,
    this.isCorrect,
  });

  StudentQuizesController _controller = Get.find<StudentQuizesController>();
  final int quizIndex;
  final isCorrect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
      child: Align(
        alignment: Alignment.centerRight,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              ArabicText(
                text:
                    'السؤال رقم ${_controller.currentQuestion + 1}    /    ${_controller.quizes[quizIndex].questions!.length}',
                color: grey1,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
