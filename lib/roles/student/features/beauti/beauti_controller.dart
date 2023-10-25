import 'package:flumuttslimer/roles/student/features/beauti/models/beuati_model.dart';
import 'package:get/get.dart';

class BeuatiController extends GetxController {
  var beuatiList = [
    BeuatiModel(
      name: 'غسل الوجه',
      describe:
          'شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح ',
      image: '',
      points: 0.2,
      isChecked: true,
    ),
    BeuatiModel(
      name: 'تنظيف الأسنان',
      describe:
          'شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح ',
      image: '',
      points: 0.5,
      isChecked: true,
    ),
    BeuatiModel(
      name: 'السلام على الأهل',
      describe:
          'شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح ',
      image: '',
      points: 0.1,
      isChecked: true,
    ),
    BeuatiModel(
      name: 'الأبتسام في وجه أخيك',
      describe:
          'شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح شرح ',
      image: '',
      points: 0.2,
      isChecked: true,
    ),
  ];

  check(int index) {
    beuatiList[index].isChecked = !beuatiList[index].isChecked!;
    update();
  }
}
