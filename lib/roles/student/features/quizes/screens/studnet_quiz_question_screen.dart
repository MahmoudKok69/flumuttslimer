import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/quiz_model.dart';
import 'package:flumuttslimer/roles/student/features/quizes/student_quizes_controller.dart';
import 'package:flumuttslimer/roles/student/features/quizes/widgets/next_previous_buttons.dart';
import 'package:flumuttslimer/roles/student/features/quizes/widgets/option_generator.dart';
import 'package:flumuttslimer/roles/student/features/quizes/widgets/the_question_section.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sizer/sizer.dart';

class StudentQuizQuestionsScreen extends StatelessWidget {
  StudentQuizQuestionsScreen({super.key});
  int quizIndex = int.tryParse(Get.parameters['index']!) ?? 0;
  final _controller = Get.find<StudentQuizesController>();

  @override
  Widget build(BuildContext context) {
    QuizModel item = _controller.quizes[quizIndex];
    return Scaffold(
      appBar: _buildAppBar(item),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
            child: GetBuilder<StudentQuizesController>(
          id: 'update_question',
          init: StudentQuizesController(),
          builder: (_) {
            return Column(
              children: [
                NumberOfQuestion(
                  quizIndex: quizIndex,
                ),
                TheQuestionSection(item: item, controller: _controller),
                SizedBox(
                  height: 10.h,
                ),
                TheOptionsGeneretor(
                  item: item,
                ),
                SizedBox(
                  height: 3.h,
                ),
                NextPreviousButtons(quizIndex: quizIndex, item: item),
                SizedBox(
                  height: 5.h,
                ),
              ],
            );
          },
        )),
      ),
    );
  }

  AppBar _buildAppBar(QuizModel item) {
    return AppBar(
      centerTitle: true,
      title: ArabicText(
        text: item.title,
        color: white,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: purblegradient,
      leading: IconButton(
        onPressed: () {
          Get.defaultDialog(
              title: 'انتبه',
              content: Text(
                'في حال الرجوع سيتم خسارة تقدمك في الاختبار, هل أنت متأكد أنك تريد الخروج؟',
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(color: grey2, fontFamily: bj, fontSize: 12.sp),
              ),
              textConfirm: 'نعم',
              onConfirm: () {
                _controller.resetValues();
                Get.back();
                Get.back();
              });
          // Get.back();
        },
        icon: Icon(
          AppIcons.back_icon,
          color: white,
          size: 16.sp,
        ),
      ),
    );
  }
}
