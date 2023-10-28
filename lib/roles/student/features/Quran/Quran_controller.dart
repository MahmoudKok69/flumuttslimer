import 'package:flumuttslimer/roles/student/features/Quran/models/Quran_card_model.dart';
import 'package:flumuttslimer/roles/student/features/Quran/models/Quran_event_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class QuranController extends GetxController {
  var alSour = [
    QuranCardModel(
      name: 'الفاتحة',
      number: '1',
    ),
    QuranCardModel(
      name: 'البقرة',
      number: '2',
    ),
    QuranCardModel(
      name: 'ال عمران',
      number: '3',
    ),
    QuranCardModel(
      name: 'النساء',
      number: '4',
    ),
  ];
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
}