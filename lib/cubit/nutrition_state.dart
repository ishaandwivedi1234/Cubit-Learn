// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'nutrition_cubit.dart';

@immutable
abstract class NutritionState {
  const NutritionState();
}

class NutritionInitial extends NutritionState {
  const NutritionInitial();
}

class NutritionLoading extends NutritionState {
  const NutritionLoading();
}

class NutritionLoaded extends NutritionState {
  final Nutrition nutrition;
  const NutritionLoaded({required this.nutrition});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NutritionLoaded && other.nutrition == nutrition;
  }
  @override
  int get hashCode => nutrition.hashCode;
}

class NutritionError extends NutritionState {
  final String message;
  const NutritionError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NutritionError && other.message == message;
  }
}
