import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nutrition_app/hive/localStorage.dart';
import 'package:nutrition_app/models/food.dart';

import '../service/FoodRepository.dart';

part 'nutrition_data_dump_state.dart';

class NutritionDataCubitCubit extends Cubit<NutritionDataCubitState> {
  final FoodRepository _foodRepository;

  final LocalStorage localStorage = LocalStorage();

  NutritionDataCubitCubit(this._foodRepository)
      : super(NutritionDataCubitInitial()) {
    dumpData();
  }

  void dumpData() async {
    try {
      emit(NutritionDataCubitLoading());
      final FoodItemList foodItemList = await _foodRepository.dumpFoodItems();
      localStorage.saveData(foodItemList.foodItems);
      emit(NutritionDataCubitLoaded(fooItemList: foodItemList));
    } catch (e) {
      emit(NutritionDataCubitError(message: e.toString()));
    }
  }
}
