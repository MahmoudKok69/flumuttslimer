import 'package:flumuttslimer/core/colors.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/quiz/result.png',
                height: 30.h,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            ArabicText(
              text:
                  'لقد أنهيت الأختبار و أجبت على  ${_controller.quizResult}  من أسئلة ${_controller.quizes[quizIndex].questions!.length}',
              maxLine: 5,
              color: grey1,
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
            ),
            ArabicText(
              text: 'هل تريد التحقق من نتائجك؟',
              maxLine: 5,
              color: grey2,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    _controller.resetValues();
                    Get.toNamed(AppPages.squizcheck,
                        parameters: {'index': quizIndex.toString()});
                  },
                  child: Container(
                    width: 25.w,
                    decoration: BoxDecoration(
                      color: purble3,
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    child: Center(
                      child: ArabicText(
                        text: 'نعم',
                        color: white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _controller.resetQuiz();
                    Get.until((route) => Get.currentRoute == AppPages.squizes);
                  },
                  child: Container(
                    width: 25.w,
                    decoration: BoxDecoration(
                      color: purble3,
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    child: Center(
                      child: ArabicText(
                        text: 'لا',
                        color: white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
