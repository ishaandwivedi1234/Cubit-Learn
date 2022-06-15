import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nutrition_app/models/nutrition.dart';
import 'package:nutrition_app/service/NutritionRepository.dart';

part 'nutrition_state.dart';

class NutritionCubit extends Cubit<NutritionState> {
  final NutritionRepository _nutritionRepository;

  NutritionCubit(this._nutritionRepository) : super(NutritionInitial());

  void search(String foodName) async {
    try {
      emit(NutritionLoading());

      final Nutrition nutrition =
          await _nutritionRepository.getNutrition(foodName);
      // print(nutrition.name.toString() + 'this is cubit');
      emit(NutritionLoaded(nutrition: nutrition));
    } catch (e) {
      emit(NutritionError(message: e.toString()));
    }
  }

  void reset() {
    emit(NutritionInitial());
  }
}
