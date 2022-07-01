part of 'nutrition_data_dump_cubit.dart';

@immutable
abstract class NutritionDataCubitState {
  const NutritionDataCubitState();
}

class NutritionDataCubitInitial extends NutritionDataCubitState {
  const NutritionDataCubitInitial();
}

class NutritionDataCubitLoading extends NutritionDataCubitState {
  const NutritionDataCubitLoading();
}

class NutritionDataCubitLoaded extends NutritionDataCubitState {
  final FoodItemList fooItemList;
  const NutritionDataCubitLoaded({required this.fooItemList});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NutritionDataCubitLoaded &&
        other.fooItemList == fooItemList;
  }

  @override
  int get hashCode => fooItemList.hashCode;
}


class NutritionDataCubitError extends NutritionDataCubitState {
  final String message;
  const NutritionDataCubitError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NutritionDataCubitError && other.message == message;
  }
}