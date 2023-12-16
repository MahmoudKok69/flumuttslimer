import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/quiz_model.dart';
import 'package:flumuttslimer/roles/student/features/quizes/student_quizes_controller.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class NextPreviousButtons extends StatelessWidget {
  NextPreviousButtons({
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
          QuestionPreviousButton(quizIndex: quizIndex),
          const Spacer(flex: 3),
          QuestionNextButton(item: item, quizIndex: quizIndex),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

class QuestionNextButton extends StatelessWidget {
  QuestionNextButton({
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
              print(_controller.quizAnswers);
              if (_controller.checkAnswers()) {
                quizSendDialog();
              } else {
                mustAnswerSnackBar();
              }
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
                        : 'أرسال',
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

  SnackbarController mustAnswerSnackBar() {
    return Get.showSnackbar(GetSnackBar(
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 1),
      backgroundColor: AppColors.white,
      messageText: ArabicText(
          text: 'عليك الإجابة على جميع الأسئلة لأرسال النتائج',
          color: AppColors.grey1,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400),
    ));
  }

  Future<dynamic> quizSendDialog() {
    return Get.defaultDialog(
      title: 'إرسال النتيجة',
      titleStyle: TextStyle(
          color: AppColors.black,
          fontFamily: AppFonts.bj,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ArabicText(
            text: 'هل تريد تأكيد أجوبتك و أرسالها ؟',
            color: AppColors.grey1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
          SizedBox(
            height: 1.h,
          ),
          ArabicText(
            text:
                'تأكد من أجوبتك قبل أرسالها, في حال أرسال النتيجة لن تكون قادر على خوض هذا الأختبار مرة أخرى ',
            maxLine: 5,
            color: AppColors.grey3,
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
          ),
          SizedBox(
            height: 4.h,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // _controller.resetValues();
                    // Get.until((route) => Get.currentRoute == AppPages.squizes);
                    // _controller.calucateResult(quizIndex);
                    _controller.calucateResult(quizIndex);
                    Get.offAndToNamed(AppPages.squizresult, parameters: {
                      'quizIndex': quizIndex.toString(),
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.purble3,
                        borderRadius: BorderRadius.circular(4.sp)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ArabicText(
                          text: 'تأكيد',
                          color: AppColors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ArabicText(
                      text: 'إلغاء',
                      color: AppColors.grey2,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class QuestionPreviousButton extends StatelessWidget {
  QuestionPreviousButton({
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
