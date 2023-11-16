// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
part 'QuranPos_model.g.dart';

@HiveType(typeId: 0)
class QuranPosModel extends HiveObject {
  @HiveField(0)
  int? sorahNum;
  @HiveField(1)
  double? scrollPos;
  @HiveField(2)
  bool? isMarked;
  QuranPosModel({
    this.sorahNum,
    this.scrollPos,
    this.isMarked,
  });
}
