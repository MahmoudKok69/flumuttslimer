import 'dart:math';

import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/extension.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/quizes/student_quizes_controller.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class QuizResultScreen extends StatelessWidget {
  QuizResultScreen({super.key});
  StudentQuizesController _controller = Get.find<StudentQuizesController>();
  final data = Get.parameters;

  @override
  Widget build(BuildContext context) {
    int quizIndex = int.tryParse(data['quizIndex']!) ?? 0;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Spacer(),
              WrongAndCorrectAnswers(
                  controller: _controller, quizIndex: quizIndex),
              Center(
                child: QuizIndicator(
                    correctAnswers: _controller.quizResult,
                    totalQuestions:
                        _controller.quizes[quizIndex].questions!.length),
              ).pSymmetric(vertical: 2.h),
              SizedBox(
                height: 2.h,
              ),
              FinishingTheQuizphase(
                  controller: _controller, quizIndex: quizIndex),
              SizedBox(
                height: 10.h,
              ),
              CheckResultPhase(),
              SizedBox(height: 2.h),
              CheckButtons(controller: _controller, quizIndex: quizIndex),
              // const Spacer(),
            ],
          ).rightDirction().pSymmetric(vertical: 1.h),
        ),
      ),
    );
  }
}

class CheckButtons extends StatelessWidget {
  const CheckButtons({
    super.key,
    required StudentQuizesController controller,
    required this.quizIndex,
  }) : _controller = controller;

  final StudentQuizesController _controller;
  final int quizIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            _controller.resetValues();
            Get.toNamed(AppPages.squizcheck,
                parameters: {'index': quizIndex.toString()});
          },
          child: Container(
            width: 35.w,
            decoration: BoxDecoration(
              color: AppColors.purble3,
              borderRadius: BorderRadius.circular(5.sp),
            ),
            child: Center(
              child: ArabicText(
                text: 'نعم',
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ).pSymmetric(vertical: 1.h),
          ),
        ),
        InkWell(
          onTap: () {
            _controller.resetQuiz();
            Get.until((route) => Get.currentRoute == AppPages.squizes);
          },
          child: Container(
            width: 35.w,
            decoration: BoxDecoration(
              color: AppColors.purble3,
              borderRadius: BorderRadius.circular(5.sp),
            ),
            child: Center(
              child: ArabicText(
                text: 'لا',
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ).pSymmetric(vertical: 1.h),
          ),
        ),
      ],
    );
  }
}

class CheckResultPhase extends StatelessWidget {
  const CheckResultPhase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ArabicText(
      text: 'هل تريد التحقق من نتائجك؟',
      maxLine: 5,
      color: AppColors.grey2,
      fontWeight: FontWeight.w400,
      fontSize: 18.sp,
    );
  }
}

class FinishingTheQuizphase extends StatelessWidget {
  const FinishingTheQuizphase({
    super.key,
    required StudentQuizesController controller,
    required this.quizIndex,
  }) : _controller = controller;

  final StudentQuizesController _controller;
  final int quizIndex;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text:
              "لقد أنهيت الأختبار و أجبت على ${_controller.quizResult} سؤال من ${_controller.quizes[quizIndex].questions!.length} أسئلة, لقد حصلت على ${_controller.quizResult * 1.5}",
          // maxLine: 5,
          style: TextStyle(
              color: AppColors.grey1,
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
              fontFamily: AppFonts.bj)),
      const WidgetSpan(child: PointIcon()),
    ]));
  }
}

class WrongAndCorrectAnswers extends StatelessWidget {
  const WrongAndCorrectAnswers({
    super.key,
    required StudentQuizesController controller,
    required this.quizIndex,
  }) : _controller = controller;

  final StudentQuizesController _controller;
  final int quizIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BorderedContainer(
        width: 95.w,
        height: 20.h,
        color: AppColors.white,
        borderWidth: 0.0,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ArabicText(
                      text: 'الأجابات الصحيحة: ${_controller.quizResult}',
                      color: AppColors.green1,
                      fontSize: 16.sp,
                    ).pOnly(left: 1.w),
                    Icon(
                      Icons.check,
                      color: AppColors.green1,
                      size: 16.sp,
                    ),
                  ],
                ).rightDirction(),
                // Spacer(),
                Row(
                  children: [
                    ArabicText(
                      text:
                          'الأجابات الخاطئة: ${_controller.quizes[quizIndex].questions!.length - _controller.quizResult}',
                      color: AppColors.red1,
                      fontSize: 16.sp,
                    ).pOnly(left: 1.w),
                    Icon(
                      Icons.close,
                      color: AppColors.red1,
                      size: 16.sp,
                    ),
                  ],
                ).rightDirction(),
              ],
            ).pSymmetric(horizontal: 2.w, vertical: 2.h),
            // Spacer(),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/quiz/result.png',
                ),
              ),
            ),
          ],
        ).rightDirction(),
      ),
    );
  }
}

class QuizIndicator extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  QuizIndicator({required this.correctAnswers, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    // Calculate the percentage of correct answers
    double percentage = correctAnswers / totalQuestions;

    // Determine the color based on the percentage
    Color fillColor = Colors.grey;
    String rate = '';
    String ratePhase = '';

    if (percentage > 0.75) {
      fillColor = AppColors.green1;
      rate = 'ممتاز';
      ratePhase = 'أحسنت! بارك الله في علمك👏';
    } else if (percentage > 0.5) {
      fillColor = const Color.fromARGB(255, 255, 232, 27);
      rate = 'جيد جداً';
      ratePhase = 'نتيجة رائعة! يمكنك دوماً أن تقدم الأفضل🙏';
    } else if (percentage > 0.25) {
      fillColor = AppColors.orange1;
      rate = 'متوسط';
      ratePhase = 'لا تيأس! بعد كل تعثر نصبح أقوى💪';
    } else {
      fillColor = AppColors.red1;
      rate = 'بحاجة لمزيد من الدراسة';
      ratePhase = 'نتيجتك لا تحدد مستواك, بأنتظار نتائجك المبهرة👌';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArabicText(
                text: rate,
                color: AppColors.grey1,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              ArabicText(
                text: ratePhase,
                maxLine: 5,
                color: AppColors.grey3,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(
            width: 45.w,
            height: 30.h,
            child: CustomPaint(
              painter: CircleProgressBarPainter(percentage, fillColor),
              child: Center(
                child: CircleAvatar(
                  radius: min(30.w, 30.h) / 2,
                  backgroundColor: AppColors.white,
                  child: Center(
                    child: Text(
                      '${(percentage * 100).toInt()}%',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color:
                            AppColors.black, // Change the text color as needed
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ).rightDirction();
  }
}

class CircleProgressBarPainter extends CustomPainter {
  final double percentage;
  final Color fillColor;

  CircleProgressBarPainter(this.percentage, this.fillColor);

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 10.0;
    final double radius = (size.shortestSide - strokeWidth) / 2;

    final Offset center = size.center(Offset.zero);

    final Paint filledPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    // Draw the entire circle with the solid color
    canvas.drawCircle(center, radius, filledPaint);

    // Draw the remaining part of the circle with light grey color
    final Paint remainingPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    final double remainingAngle = 2 * pi * (1 - percentage);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi / 2,
      remainingAngle,
      true,
      remainingPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
