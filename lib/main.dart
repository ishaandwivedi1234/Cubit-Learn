import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/cubit/nutrition_cubit.dart';
import 'package:nutrition_app/pages/nutritions/nutritionFinder.dart';
import 'package:nutrition_app/pages/nutritions/widgets/nutritionSearch.dart';
import 'package:nutrition_app/service/NutritionRepository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => NutritionCubit(NutritionServiceRepo()),
        child: NutritionFinder(),
      ),
    );
  }
}
