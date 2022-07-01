import 'dart:convert';

import 'package:nutrition_app/models/food.dart';
import 'package:http/http.dart' as http;

abstract class FoodRepository {
  Future<FoodItemList> dumpFoodItems();
}

class FoodServiceRepo extends FoodRepository {
  @override
  Future<FoodItemList> dumpFoodItems() async {
    print('fetching data');
    var url = Uri.parse('http://7c35-34-73-253-144.ngrok.io/api/v1/getAllData');
    final response = await http.get(url);
    print(response.statusCode);
    ;
    var resBody = jsonDecode(response.body);

    if (response.statusCode != 200 || resBody['status'] != 200)
      throw Exception('Failed to load food');
    var foodItems = resBody['data'];
    FoodItemList foodItemList = FoodItemList(foodItems: []);
    for (var foodItem in foodItems) {
      foodItemList.foodItems.add(FoodItem(
          id: foodItem['id'],
          category: foodItem['category'],
          carbs: foodItem['carbs'],
          calories: foodItem['calories'],
          protein: foodItem['protein'],
          fats: foodItem['fats'],
          fiber: foodItem['fiber'],
          name: foodItem['name'],
          food_type: foodItem['food_type']));
    }
    print(foodItemList.foodItems.length);
    print(foodItemList.foodItems.first.name);
    return foodItemList;
  }
}
