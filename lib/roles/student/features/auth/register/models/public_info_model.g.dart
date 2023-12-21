// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PublicInfoModelAdapter extends TypeAdapter<PublicInfoModel> {
  @override
  final int typeId = 1;

  @override
  PublicInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PublicInfoModel(
      name: fields[0] as String?,
      id: fields[1] as String?,
      group_id: fields[2] as String?,
      token: fields[3] as String?,
      email: fields[4] as String?,
      password: fields[5] as String?,
      gender: fields[6] as String?,
      phone_number: fields[7] as String?,
      avatar: fields[8] as String?,
      points: fields[9] as double?,
      address: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PublicInfoModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.group_id)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.phone_number)
      ..writeByte(8)
      ..write(obj.avatar)
      ..writeByte(9)
      ..write(obj.points)
      ..writeByte(10)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PublicInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
