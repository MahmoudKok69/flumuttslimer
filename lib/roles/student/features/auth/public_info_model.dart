// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
part 'public_info_model.g.dart';

@HiveType(typeId: 1)
class PublicInfoModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? group_id;
  @HiveField(3)
  String? token;
  @HiveField(4)
  String? email;
  @HiveField(5)
  String? password;
  @HiveField(6)
  String? gender;
  @HiveField(7)
  String? phone_number;
  @HiveField(8)
  String? avatar;
  @HiveField(9)
  double? points;
  @HiveField(10)
  String? address;
  PublicInfoModel({
    this.name,
    this.id,
    this.group_id,
    this.token,
    this.email,
    this.password,
    this.gender,
    this.phone_number,
    this.avatar,
    this.points,
    this.address,
  });
}
