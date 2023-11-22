import 'package:flumuttslimer/roles/student/features/rank/models/rank_model.dart';
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
  var world_users = [];
  var city_users = [];
  var inistu_users = [];
  var group_users = [];
}
