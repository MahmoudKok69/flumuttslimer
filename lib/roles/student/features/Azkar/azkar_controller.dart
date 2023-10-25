import 'package:flumuttslimer/roles/student/features/Azkar/models/azkar_model.dart';
import 'package:flumuttslimer/roles/student/features/Azkar/models/azkary_model.dart';
import 'package:get/get.dart';

class AzkarController extends GetxController {
  var azkar = [
    AzkarModel(
        name: 'الذكر الأول',
        descirbe:
            'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرحالشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرحالشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرحالشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرحالشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرحالشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرحالشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرحالشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرحالشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرحالشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
    AzkarModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
    AzkarModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
    AzkarModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
    AzkarModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
    AzkarModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
    AzkarModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
    AzkarModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
    AzkarModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
    AzkarModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
    AzkarModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
    AzkarModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح'),
  ];
  var azkary = [
    AzkaryModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح',
        isChecked: false,
        points: 1.5),
    AzkaryModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح',
        isChecked: false,
        points: 5.5),
    AzkaryModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح',
        isChecked: true,
        points: 2),
    AzkaryModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح',
        isChecked: false,
        points: 4),
    AzkaryModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح',
        isChecked: true,
        points: 2),
    AzkaryModel(
        name: 'الذكر الأول',
        descirbe: 'الشرح الشرح الشرح الشرح الشرح الشرح الشرح الشرح',
        isChecked: true,
        points: 1.5),
  ];

  checkAzkar(int index) {
    azkary[index].isChecked = !azkary[index].isChecked!;
    update(['azkary_tile']);
  }
}
