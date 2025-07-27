// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_food_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveFoodResultAdapter extends TypeAdapter<SaveFoodResult> {
  @override
  final int typeId = 1;

  @override
  SaveFoodResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveFoodResult(
      portionName: fields[0] as String,
      product: fields[1] as SaveFoodProduct,
      eatenKcal: fields[2] as double,
      eatenCarbs: fields[3] as double,
      ke: fields[4] as String,
      be: fields[5] as String,
      dateTime: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SaveFoodResult obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.portionName)
      ..writeByte(1)
      ..write(obj.product)
      ..writeByte(2)
      ..write(obj.eatenKcal)
      ..writeByte(3)
      ..write(obj.eatenCarbs)
      ..writeByte(4)
      ..write(obj.ke)
      ..writeByte(5)
      ..write(obj.be)
      ..writeByte(6)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveFoodResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
