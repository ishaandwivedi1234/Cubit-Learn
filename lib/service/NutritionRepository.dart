import 'dart:convert';

import 'package:nutrition_app/models/nutrition.dart';
import 'package:http/http.dart' as http;

abstract class NutritionRepository {
  Future<Nutrition> getNutrition(var foodName);
}

class NutritionServiceRepo extends NutritionRepository {
  @override
  Future<Nutrition> getNutrition(var foodName) async {
    // TODO: implement getNutrition
    var url = Uri.parse(
        'https://api.nutritionix.com/v1_1/search/$foodName?results=0:20&fields=item_name,brand_name,item_id,nf_calories,nf_total_fat,nf_protein,nf_vitamin_a_dv,nf_cholesterol&appId=006c432a&appKey=53141ed2807cc0b1c1333c499a6ff8ba');
    // print(url);
    final response = await http.get(url);
    if (response.statusCode != 200) throw Exception('Failed to load nutrition');
    final jsonResponse = json.decode(response.body);
    var hits = jsonResponse['hits'];
    if (hits.isEmpty) throw Exception('No nutrition found');
    var nutritions = hits[0]['fields'];
    final nutrition = Nutrition.fromJson(nutritions);
    return nutrition;
  }
}
