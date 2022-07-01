// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodItemListAdapter extends TypeAdapter<FoodItemList> {
  @override
  final int typeId = 1;

  @override
  FoodItemList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodItemList(
      foodItems: (fields[0] as List).cast<FoodItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, FoodItemList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.foodItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodItemListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FoodItemAdapter extends TypeAdapter<FoodItem> {
  @override
  final int typeId = 0;

  @override
  FoodItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodItem(
      id: fields[0] as dynamic,
      category: fields[1] as dynamic,
      carbs: fields[2] as dynamic,
      calories: fields[3] as dynamic,
      protein: fields[4] as dynamic,
      fats: fields[5] as dynamic,
      fiber: fields[6] as dynamic,
      name: fields[7] as dynamic,
      food_type: fields[8] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, FoodItem obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.carbs)
      ..writeByte(3)
      ..write(obj.calories)
      ..writeByte(4)
      ..write(obj.protein)
      ..writeByte(5)
      ..write(obj.fats)
      ..writeByte(6)
      ..write(obj.fiber)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.food_type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
