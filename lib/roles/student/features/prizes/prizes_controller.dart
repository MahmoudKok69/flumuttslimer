import 'package:flumuttslimer/roles/student/features/prizes/models/prize_model.dart';
import 'package:get/get.dart';

class PrizesController extends GetxController {
  var prizes = [
    PrizeModel(
        name: 'ايفون 14 برو ماكس',
        age: 18,
        points: 200,
        image: '',
        company: ''),
    PrizeModel(
        name: 'سيارة مرسيدس', age: 18, points: 100, image: '', company: ''),
    PrizeModel(
        name: 'شقة اربع غرف', age: 18, points: 70, image: '', company: ''),
    PrizeModel(name: 'فرطة دهب', age: 18, points: 400, image: '', company: ''),
    PrizeModel(name: '10.000\$', age: 18, points: 800, image: '', company: ''),
  ];
  getMyPrizes() {
    var myPrize = prizes.where((element) => element.points! <= 75);
    return myPrize;
  }
}
