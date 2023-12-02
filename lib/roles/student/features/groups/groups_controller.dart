import 'package:flumuttslimer/roles/student/features/groups/models/groups_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SGroupsController extends GetxController {
  List<SGroupCardModel> groups = [
    SGroupCardModel(
        name: 'عباد الرحمن',
        teacher_name: 'أستاذ الأستاذ',
        number: 15,
        maxNumber: 30,
        isAvailable: true,
        description:
            'نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص '),
    SGroupCardModel(
        name: 'عباد الرحمن',
        teacher_name: 'أستاذ الأستاذ',
        number: 15,
        maxNumber: 30,
        isAvailable: false,
        description:
            'نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص '),
    SGroupCardModel(
        name: 'عباد الرحمن',
        teacher_name: 'أستاذ الأستاذ',
        number: 15,
        maxNumber: 30,
        isAvailable: false,
        description:
            'نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص '),
    SGroupCardModel(
        name: 'عباد الرحمن',
        teacher_name: 'أستاذ الأستاذ',
        number: 15,
        maxNumber: 30,
        isAvailable: true,
        description:
            'نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص '),
  ];
  TextEditingController groubLinkController = TextEditingController();
}
