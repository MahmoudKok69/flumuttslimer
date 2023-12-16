import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/quiz_model.dart';
import 'package:flumuttslimer/roles/student/features/quizes/student_quizes_controller.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CheckNextPreviousButtons extends StatelessWidget {
  CheckNextPreviousButtons({
    super.key,
    required this.quizIndex,
    required this.item,
  });

  final int quizIndex;
  final QuizModel item;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          const Spacer(flex: 1),
          CheckQuestionPreviousButton(quizIndex: quizIndex),
          const Spacer(flex: 3),
          CheckQuestionNextButton(item: item, quizIndex: quizIndex),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

class CheckQuestionNextButton extends StatelessWidget {
  CheckQuestionNextButton({
    super.key,
    required this.item,
    required this.quizIndex,
  });

  final QuizModel item;
  final int quizIndex;
  StudentQuizesController _controller = Get.find<StudentQuizesController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _controller.currentQuestion != item.questions!.length - 1
          ? () {
              _controller.nextQuestion(quizIndex);
            }
          : () {
              _controller.resetQuiz();
              Get.until((route) => Get.currentRoute == AppPages.squizes);
            },
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.purble3,
              borderRadius: BorderRadius.circular(4.sp)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ArabicText(
                    text: _controller.currentQuestion !=
                            item.questions!.length - 1
                        ? 'التالي'
                        : 'الخروج',
                    color: AppColors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  Transform.flip(
                    flipX: false,
                    child: Icon(
                      AppIcons.back_icon,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckQuestionPreviousButton extends StatelessWidget {
  CheckQuestionPreviousButton({
    super.key,
    required this.quizIndex,
  });

  StudentQuizesController _controller = Get.find<StudentQuizesController>();
  final int quizIndex;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _controller.currentQuestion != 0,
      child: InkWell(
        onTap: () {
          _controller.previousQuestion(quizIndex);
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.purble3,
              borderRadius: BorderRadius.circular(4.sp)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Transform.flip(
                    flipX: true,
                    child: Icon(
                      AppIcons.back_icon,
                      color: AppColors.white,
                    ),
                  ),
                  ArabicText(
                    text: 'السابق',
                    color: AppColors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
