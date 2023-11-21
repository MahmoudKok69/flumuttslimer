import 'package:flumuttslimer/roles/student/features/Quran/Quran.dart';
import 'package:flumuttslimer/roles/student/features/Quran/models/QuranPos_model.dart';
import 'package:flumuttslimer/roles/student/features/Quran/models/Quran_event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class QuranController extends GetxController {
  var alSour = Quran.map((element) => element['name']).toList();
  int sorahNum = 0;
  double scrollPos = 0.0;
  bool isMarked = false; // Added variable
  var box;
  Rx<ScrollController> scrollController =
      Rx<ScrollController>(ScrollController());

  var events = [
    QuranEventModel(
      name: "تسميع سورة يس",
      points: 2.5,
      date: DateTime(2023, 2, 5),
      teacherName: 'أبو الكوك',
    ),
    QuranEventModel(
      name: "ختم الجزء الرابع",
      points: 7,
      date: DateTime(2022, 9, 2),
      teacherName: 'أبو الكوك',
    ),
    QuranEventModel(
      name: "ختم الجزء الثالث",
      points: 2.5,
      date: DateTime(2022, 8, 16),
      teacherName: 'أبو الكوك',
    ),
  ];

  @override
  void onInit() async {
    super.onInit();
    box = await Hive.openBox<QuranPosModel>('QuranPos');
    await loadValues();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToPosition();
    });
  }


  void scrollToPosition() {
    if (scrollController.value.hasClients) {
      scrollController.value.jumpTo(scrollPos);
    } else {
      // ScrollController is not attached yet, let's wait and try again
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToPosition();
      });
    }
  }

  changeMarked() async {
    isMarked = !isMarked;
    if (!isMarked) {
      sorahNum = 0;
      scrollPos = 0;
    }
    await saveValues();
    update(['add_mark']);
  }

  Future<void> saveValues() async {
    // Save values without directly accessing position
    var newValues = QuranPosModel()
      ..sorahNum = sorahNum
      ..scrollPos = scrollPos
      ..isMarked = isMarked; // Save isMarked

    await box.put('lastValues', newValues);
  }

  Future<void> loadValues() async {
    var lastValues = await box.get('lastValues');
    if (lastValues != null) {
      sorahNum = lastValues.sorahNum ?? 0;
      scrollPos = lastValues.scrollPos ?? 0.0;
      isMarked = lastValues.isMarked ?? false; // Load isMarked
    }
  }
}
