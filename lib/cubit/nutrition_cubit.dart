import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nutrition_app/hive/localStorage.dart';
import 'package:nutrition_app/models/food.dart';
import 'package:nutrition_app/models/nutrition.dart';
import 'package:nutrition_app/service/NutritionRepository.dart';

part 'nutrition_state.dart';

class NutritionCubit extends Cubit<NutritionState> {
  final NutritionRepository _nutritionRepository;
  final LocalStorage localStorage = LocalStorage();
  NutritionCubit(this._nutritionRepository) : super(NutritionInitial());

  void search(String foodName) async {
    try {
      emit(const NutritionLoading());

      // final Nutrition nutritionWithFoodItem =
      //     await _nutritionRepository.getNutrition(foodName);
      // print(nutrition.name.toString() + 'this is cubit');

      var foodItem = localStorage.findByName(foodName);

      Nutrition nutritionWithFoodItem = Nutrition(
        calories: foodItem.calories,
        protein: foodItem.protein,
        totalFat: foodItem.fats,
        vitaminA: foodItem.category,
        cholesterol: foodItem.carbs,
        name: foodItem.name,
      );

      emit(NutritionLoaded(nutrition: nutritionWithFoodItem));
    } catch (e) {
      print(e.toString());
      emit(NutritionError(message: e.toString()));
    }
  }

  void reset() {
    emit(NutritionInitial());
  }
}
