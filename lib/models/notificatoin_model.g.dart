// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificatoin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationModelAdapter extends TypeAdapter<NotificationModel> {
  @override
  final int typeId = 1;

  @override
  NotificationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationModel(
      id: fields[0] as int,
      titleAr: fields[1] as String,
      titleEn: fields[2] as String,
      bodyAr: fields[3] as String,
      bodyEn: fields[4] as String,
      date: fields[5] as String,
      type: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titleAr)
      ..writeByte(2)
      ..write(obj.titleEn)
      ..writeByte(3)
      ..write(obj.bodyAr)
      ..writeByte(4)
      ..write(obj.bodyEn)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
