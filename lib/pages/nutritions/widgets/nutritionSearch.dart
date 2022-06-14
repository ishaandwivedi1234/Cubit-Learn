import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/cubit/nutrition_cubit.dart';

class NutritionSearch extends StatelessWidget {
  NutritionSearch({Key? key}) : super(key: key);

  final TextEditingController foodNameController = TextEditingController();

  void search(BuildContext context) {
    if (foodNameController.text.isNotEmpty) {
      print(foodNameController.text);
      final foodItem = foodNameController.text;
      BlocProvider.of<NutritionCubit>(context).search(foodNameController.text);
      foodNameController.clear();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please enter a food name')));
      print('no food item entered');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Search Nutrition Facts',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Enter the name of the food item',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: TextFormField(
            controller: foodNameController,
            decoration: const InputDecoration(
                hintText: "Write food item name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.88,
          child: ElevatedButton(
            onPressed: () {
              search(context);
            },
            child: const Text('Search'),
          ),
        )
      ],
    );
  }
}
