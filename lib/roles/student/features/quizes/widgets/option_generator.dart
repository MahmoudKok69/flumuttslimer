import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/layout.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/quiz_model.dart';
import 'package:flumuttslimer/roles/student/features/quizes/student_quizes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TheOptionsGeneretor extends StatelessWidget {
  TheOptionsGeneretor({super.key, required this.item});
  final item;
  var _controller = Get.find<StudentQuizesController>();
  final alphbet = ["أ", "ب", "ج", "د"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 3.h),
          child: InkWell(
              onTap: () {
                _controller.selectAnswer(
                    _controller.currentQuestion,
                    item.questions![_controller.currentQuestion]
                        .options![index]);
              },
              child: GetBuilder(
                id: 'update_option',
                init: StudentQuizesController(),
                builder: (_) {
                  return BorderedContainer(
                    width: Get.size.width * 0.9,
                    color: checkIfAnswer(item, index)
                        ? AppColors.purble3
                        : AppColors.white,
                    borderWidth: checkIfAnswer(item, index) ? 0.0 : 0.1.w,
                    borderColor: checkIfAnswer(item, index)
                        ? AppColors.purble3
                        : AppColors.grey4,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
                      child: ArabicText(
                        text:
                            '${alphbet[index]} - ${item.questions![_controller.currentQuestion].options![index]}',
                        fontSize: 14.sp,
                        color: _controller.quizAnswers![
                                    _controller.currentQuestion] ==
                                item.questions![_controller.currentQuestion]
                                    .options![index]
                            ? AppColors.white
                            : AppColors.grey1,
                      ),
                    ),
                  );
                },
              )),
        );
      }),
    );
  }

  bool checkIfAnswer(item, optionIndex) {
    return _controller.quizAnswers![_controller.currentQuestion] ==
        item.questions![_controller.currentQuestion].options![optionIndex];
  }
}
