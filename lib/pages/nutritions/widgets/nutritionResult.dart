import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/models/nutrition.dart';

import '../../../cubit/nutrition_cubit.dart';

class NutritionResult extends StatelessWidget {
  const NutritionResult({Key? key, required this.nutrition}) : super(key: key);
  final Nutrition nutrition;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Nutrition Fact',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Wrap(
                children: [
                  const Text(
                    'Following are the nutrition facts of the ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    nutrition.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            ResultTile(
              title: "Calories",
              subtitle: '${nutrition.calories}g',
              index: 1,
            ),
            ResultTile(
              title: "Total Fat",
              subtitle: '${nutrition.totalFat}g',
              index: 2,
            ),
            ResultTile(
              title: "Cholesterol",
              subtitle: '${nutrition.cholesterol}g',
              index: 3,
            ),
            ResultTile(
              title: "Protein",
              subtitle: '${nutrition.protein}g',
              index: 4,
            ),
            // ResultTile(
            //   title: "Vitamin A",
            //   subtitle: '${nutrition.vitaminA}g',
            //   index: 5,
            // ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<NutritionCubit>(context).reset();
                },
                child: const Text('FIND ANOTHER (BACK)'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ResultTile extends StatelessWidget {
  const ResultTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.index,
  }) : super(key: key);
  final String title;
  final String subtitle;

  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(index.toString()),
      title: Text(title),
      trailing: Text(
        subtitle,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
      ),
    );
  }
}
