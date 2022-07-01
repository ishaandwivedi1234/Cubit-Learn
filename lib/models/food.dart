import 'package:hive/hive.dart';

part 'food.g.dart';

@HiveType(typeId: 1)
class FoodItemList extends HiveObject {
  @HiveField(0)
  final List<FoodItem> foodItems;
  FoodItemList({required this.foodItems});
}

@HiveType(typeId: 0)
class FoodItem extends HiveObject {
  @HiveField(0)
  var id;
  @HiveField(1)
  var category;
  @HiveField(2)
  var carbs;
  @HiveField(3)
  var calories;
  @HiveField(4)
  var protein;
  @HiveField(5)
  var fats;
  @HiveField(6)
  var fiber;
  @HiveField(7)
  var name;
  @HiveField(8)
  var food_type;

  FoodItem({
    required this.id,
    required this.category,
    required this.carbs,
    required this.calories,
    required this.protein,
    required this.fats,
    required this.fiber,
    required this.name,
    required this.food_type,
  });
}
