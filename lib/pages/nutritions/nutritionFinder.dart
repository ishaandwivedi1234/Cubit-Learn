import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/cubit/nutrition_cubit.dart';
import 'package:nutrition_app/pages/nutritions/widgets/nutritionResult.dart';
import 'package:nutrition_app/pages/nutritions/widgets/nutritionSearch.dart';
import 'package:nutrition_app/pages/nutritions/widgets/nutritionSearching.dart';

class NutritionFinder extends StatelessWidget {
  const NutritionFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nutrition Finder'),
        ),
        body: BlocConsumer<NutritionCubit, NutritionState>(
          listener: (context, state) {
            if (state is NutritionError) {
              print(state.message);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is NutritionInitial) {
              return NutritionSearch();
            } else if (state is NutritionLoading) {
              return const NutritionSearching();
            } else if (state is NutritionLoaded) {
              return NutritionResult(nutrition: state.nutrition);
            } else
              return NutritionSearch();
          },
        ));
  }
}
