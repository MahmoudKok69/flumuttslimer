// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuranPos_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranPosModelAdapter extends TypeAdapter<QuranPosModel> {
  @override
  final int typeId = 0;

  @override
  QuranPosModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranPosModel(
      sorahNum: fields[0] as int?,
      scrollPos: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, QuranPosModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.sorahNum)
      ..writeByte(1)
      ..write(obj.scrollPos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranPosModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
