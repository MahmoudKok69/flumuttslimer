import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/roles/student/features/rank/models/rank_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RankController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Rxn<AnimationController> _animationController =
      Rxn<AnimationController>();
  AnimationController? get animationController => _animationController.value;

  final Rxn<Animation<Color?>> _colorAnimation = Rxn<Animation<Color?>>();
  Animation<Color?>? get colorAnimation => _colorAnimation.value;
  final Rxn<Animation<Alignment?>> _alignAnimation =
      Rxn<Animation<Alignment?>>();
  Animation<Alignment?>? get alignAnimation => _alignAnimation.value;

  @override
  void onInit() {
    super.onInit();
    const duration = Duration(milliseconds: 2000);
    _animationController.value = AnimationController(
      vsync: this,
      duration: duration,
    );
    _colorAnimation.value = (ColorTween(begin: orange1, end: purble2)
        .chain(CurveTween(curve: Curves.ease))
        .animate(_animationController.value!)
      ..addListener(() {
        update();
      }));

    _animationController.value?.forward();
    _animationController.value?.reverse();
    _animationController.value?.repeat();
  }

  @override
  void onClose() {
    _animationController.value?.dispose();
    super.onClose();
  }

  var firstThree = [
    RankStudensModel(name: 'كوك', teacherName: '', points: 500, age: 10),
    RankStudensModel(name: 'حمدي', teacherName: '', points: 420, age: 10),
    RankStudensModel(name: 'سليمان', teacherName: '', points: 400, age: 10),
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
