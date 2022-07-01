import 'package:hive/hive.dart';

import '../models/food.dart';

class Boxes {
  static Box<FoodItemList> getFoodItemsBox() =>
      Hive.box<FoodItemList>('foodItems');
}

void initBoxes() {
  if (!Boxes.getFoodItemsBox().containsKey('foodItems')) {
    Boxes.getFoodItemsBox().put('foodItems',FoodItemList(foodItems: []));
  }
}
