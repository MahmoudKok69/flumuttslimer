import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/roles/student/features/rank/models/rank_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RankController extends GetxController {
  var users = [
    RankStudensModel(name: 'كوك', teacherName: '', points: 500, age: 10),
    RankStudensModel(name: 'حمدي', teacherName: '', points: 420, age: 10),
    RankStudensModel(name: 'سليمان', teacherName: '', points: 400, age: 10),
    RankStudensModel(name: 'سليمان', teacherName: 'فتحي', points: 400, age: 10),
    RankStudensModel(name: 'سليمان', teacherName: 'كامل', points: 400, age: 10),
    RankStudensModel(name: 'سليمان', teacherName: 'فتحي', points: 400, age: 10),
    RankStudensModel(name: 'سليمان', teacherName: 'كامل', points: 400, age: 10),
    RankStudensModel(name: 'سليمان', teacherName: 'عبدو', points: 400, age: 10),
  ];

  var circlColors = [orange1, Colors.red, Colors.black];
  int colorIndex = 0;
  changeColor() {
    colorIndex++;
    colorIndex = colorIndex % circlColors.length;
    Future.delayed(const Duration(milliseconds: 500));
    if (colorIndex < 3) {
      print(colorIndex);
      update(['circle']);
    }
  }
}
