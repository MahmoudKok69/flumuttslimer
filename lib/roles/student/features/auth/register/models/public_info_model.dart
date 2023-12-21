// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  PublicInfoModel copyWith({
    String? name,
    String? id,
    String? group_id,
    String? token,
    String? email,
    String? password,
    String? gender,
    String? phone_number,
    String? avatar,
    double? points,
    String? address,
  }) {
    return PublicInfoModel(
      name: name ?? this.name,
      id: id ?? this.id,
      group_id: group_id ?? this.group_id,
      token: token ?? this.token,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      phone_number: phone_number ?? this.phone_number,
      avatar: avatar ?? this.avatar,
      points: points ?? this.points,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'group_id': group_id,
      'token': token,
      'email': email,
      'password': password,
      'gender': gender,
      'phone_number': phone_number,
      'avatar': avatar,
      'points': points,
      'address': address,
    };
  }

  factory PublicInfoModel.fromMap(Map<String, dynamic> map) {
    return PublicInfoModel(
      name: map['name'] != null ? map['name'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      group_id: map['group_id'] != null ? map['group_id'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      phone_number:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      points: map['points'] != null ? map['points'] as double : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicInfoModel.fromJson(String source) =>
      PublicInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PublicInfoModel(name: $name, id: $id, group_id: $group_id, token: $token, email: $email, password: $password, gender: $gender, phone_number: $phone_number, avatar: $avatar, points: $points, address: $address)';
  }

  @override
  bool operator ==(covariant PublicInfoModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.group_id == group_id &&
        other.token == token &&
        other.email == email &&
        other.password == password &&
        other.gender == gender &&
        other.phone_number == phone_number &&
        other.avatar == avatar &&
        other.points == points &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        group_id.hashCode ^
        token.hashCode ^
        email.hashCode ^
        password.hashCode ^
        gender.hashCode ^
        phone_number.hashCode ^
        avatar.hashCode ^
        points.hashCode ^
        address.hashCode;
  }
}
