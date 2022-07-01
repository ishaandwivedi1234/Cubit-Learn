import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nutrition_app/cubit/nutrition_cubit.dart';
import 'package:nutrition_app/cubit/nutrition_data_dump_cubit.dart';
import 'package:nutrition_app/hive/boxes.dart';
import 'package:nutrition_app/models/food.dart';
import 'package:nutrition_app/pages/nutritions/nutritionFinder.dart';
import 'package:nutrition_app/pages/nutritions/widgets/nutritionSearch.dart';
import 'package:nutrition_app/service/FoodRepository.dart';
import 'package:nutrition_app/service/NutritionRepository.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'pages/Dumper/dumper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter((FoodItemAdapter()));
  Hive.registerAdapter((FoodItemListAdapter()));
  await Hive.openBox<FoodItemList>('foodItems');

  initBoxes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NutritionDataCubitCubit(FoodServiceRepo()),
        ),
        BlocProvider(
          create: (context) => NutritionCubit(NutritionServiceRepo()),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => FoodDataDumperLoader(),
            '/nutritionFind': (context) => NutritionFinder(),
          }),
    );
  }
}
