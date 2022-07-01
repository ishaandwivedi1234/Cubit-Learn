import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nutrition_app/cubit/nutrition_cubit.dart';
import 'package:nutrition_app/models/food.dart';
import 'package:nutrition_app/models/nutrition.dart';
import 'package:nutrition_app/service/NutritionRepository.dart';

class MockNutrtionRepository extends Mock implements NutritionServiceRepo {}

class MockNutritionCubit extends NutritionCubit {
  MockNutritionCubit(NutritionServiceRepo nutritionRepository)
      : super(nutritionRepository);

  @override
  void search(String foodName) {
    try {
      emit(const NutritionLoading());

      var foodItem = FoodItem(
          id: '1',
          category: 'testCat',
          carbs: 10,
          calories: 10,
          protein: 10,
          fats: 10,
          fiber: 10,
          name: 'testName',
          food_type: 'veg');

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
}

void main() async {
  MockNutrtionRepository mockNutrtionRepository = MockNutrtionRepository();
  NutritionCubit nutritionCubit = NutritionCubit(MockNutrtionRepository());

  test('initial state should be NutritionInitial', () {
    expect(nutritionCubit.state.runtimeType, NutritionInitial);
  });

  group('Testing cubit flow', () {
    test('Checking Error state', () {
      var foodItem = FoodItem(
          id: '1',
          category: 'testCat',
          carbs: 10,
          calories: 10,
          protein: 10,
          fats: 10,
          fiber: 10,
          name: 'testName',
          food_type: 'veg');

      final cubit = NutritionCubit(mockNutrtionRepository);

      Nutrition nutritionWithFoodItem = Nutrition(
        calories: foodItem.calories,
        protein: foodItem.protein,
        totalFat: foodItem.fats,
        vitaminA: foodItem.category,
        cholesterol: foodItem.carbs,
        name: foodItem.name,
      );

      expectLater(cubit.state.runtimeType, NutritionInitial);
      cubit.search('roti');
      expectLater(cubit.state.runtimeType, NutritionError);
    });

    test('Checking correct state', () {
      var foodItem = FoodItem(
          id: '1',
          category: 'testCat',
          carbs: 10,
          calories: 10,
          protein: 10,
          fats: 10,
          fiber: 10,
          name: 'testName',
          food_type: 'veg');

      final cubit = MockNutritionCubit(mockNutrtionRepository);

      Nutrition nutritionWithFoodItem = Nutrition(
        calories: foodItem.calories,
        protein: foodItem.protein,
        totalFat: foodItem.fats,
        vitaminA: foodItem.category,
        cholesterol: foodItem.carbs,
        name: foodItem.name,
      );

      

      expectLater(cubit.state.runtimeType, NutritionInitial);
      cubit.search('roti');
      
      expectLater(cubit.state.runtimeType, NutritionLoaded);
    });
  });
}
