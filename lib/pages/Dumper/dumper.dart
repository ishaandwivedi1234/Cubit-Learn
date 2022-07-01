import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/cubit/nutrition_data_dump_cubit.dart';
import 'package:nutrition_app/pages/nutritions/nutritionFinder.dart';

class FoodDataDumperLoader extends StatelessWidget {
  const FoodDataDumperLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NutritionDataCubitCubit, NutritionDataCubitState>(
        listener: (context, state) {
          if (state is NutritionDataCubitError) {
            print(state.message);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is NutritionDataCubitLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                    "Data is dumped successfully ! Redirecting to main page in 5 seconds")));
            Future.delayed(const Duration(seconds: 5), () {
              Navigator.of(context).pushNamed('/nutritionFind');
            });
          }
        },
        builder: (context, state) {
          if (state is NutritionDataCubitInitial) {
            return const Center(
              child: Text("Initializing app...."),
            );
          } else if (state is NutritionDataCubitLoading) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: Text("Dumping Food Data To Local Storage...."),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          } else if (state is NutritionDataCubitLoaded) {
            return const Center(
              child: Text("Food Data Dumped To Local Storage"),
            );
          } else
            return Center(
              child: Text("Initializing app...."),
            );
        },
      ),
    );
  }
}
