import 'package:nutrition_app/hive/boxes.dart';
import 'package:nutrition_app/models/food.dart';

class LocalStorage {
  void saveData(List<FoodItem> foodItems) async {
    try {
      final box = Boxes.getFoodItemsBox();
      FoodItemList foodItemList = FoodItemList(foodItems: foodItems);
      box.put('foodItems', foodItemList);
      print('food data saved in local db');
    } catch (e) {
      print(e);
    }
  }

  hasData() {
    try {
      final box = Boxes.getFoodItemsBox();
      FoodItemList foodItemList = box.get('foodItems')!;
      if (foodItemList.foodItems.isNotEmpty) return true;
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  findByName(name) {
    print('finding food item by name');
    final box = Boxes.getFoodItemsBox();
    print(hasData());
    FoodItemList? foodItemList = box.get('foodItems');
    if (foodItemList == null) throw new Exception('No data found in local db');
    var item = foodItemList.foodItems.firstWhere((element) => element.name
        .toString()
        .toLowerCase()
        .contains(name.toString().toLowerCase()));

    if (item == null) throw new Exception('Food not found');
    return item;
  }
}
