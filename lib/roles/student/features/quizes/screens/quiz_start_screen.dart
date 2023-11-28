import 'package:flumuttslimer/core/AppIcons.dart';
import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/quiz_model.dart';
import 'package:flumuttslimer/roles/student/features/quizes/student_quizes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StudentQuizStartScreen extends StatelessWidget {
  StudentQuizStartScreen({super.key});
  final data = Get.parameters;
  final _controller = Get.find<StudentQuizesController>();
  @override
  Widget build(BuildContext context) {
    print('sajkkkkkkkkkkkkk');
    print(data);
    int index = int.tryParse(data['index']!) ?? 0;
    var item = _controller.quizes[index];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purblegradient,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            AppIcons.back_icon,
            color: white,
            size: 16.sp,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [purblegradient, purble3],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              SizedBox(
                height: 32.h,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.title!,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: white,
                          fontSize: 20.sp,
                          fontFamily: bj,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'الأستاذ: ${item.teacher_name}',
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: white,
                          fontSize: 15.sp,
                          fontFamily: bj,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 80.w,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${item.questions!.length} سؤال',
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: white,
                                  fontSize: 19.sp,
                                  fontFamily: bj,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${item.points} نقطة',
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: white,
                                  fontSize: 19.sp,
                                  fontFamily: bj,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 6.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'بدأ',
                          style: TextStyle(
                            color: purble3,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            fontFamily: bj,
                          ),
                        ),
                        Icon(
                          AppIcons.back_icon,
                          color: purble3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
