import 'package:dishes_sets_franek/models/meal.dart';
import 'package:dishes_sets_franek/widget/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/const.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class MealScreen extends StatelessWidget {
 const MealScreen({Key? key}) : super(key: key);

 static const id = 'categoryMealScreen';

  @override
  Widget build(BuildContext context) {
    /*defining what the args passed in CategoryItem are and using them*/
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

   /* ?? to avoid null safty means when null asign ""*/
    var title = routArgs['title'] ?? '';
    final id = routArgs['id'] ?? '';

   /* creating new list containing only meals with id passed from categories screen*/
    List<Meal> categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();

    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Center(
          child: Text(
            title,
            style: kTextMainTitle,
          ),
        ),
      ),
      body: Scaffold(
        body: Container(
          color: kOrangeColor.withOpacity(0.6),
          child: ListView(
            children: [
              ...categoryMeals.map((e) {
                return MealItem(
                  meal: e,
                );
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
