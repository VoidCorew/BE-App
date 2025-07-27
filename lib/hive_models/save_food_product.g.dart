// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_food_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveFoodProductAdapter extends TypeAdapter<SaveFoodProduct> {
  @override
  final int typeId = 0;

  @override
  SaveFoodProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveFoodProduct(
      name: fields[0] as String,
      kcal: fields[1] as double,
      carbs: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SaveFoodProduct obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.kcal)
      ..writeByte(2)
      ..write(obj.carbs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveFoodProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
