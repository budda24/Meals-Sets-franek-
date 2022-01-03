import 'package:dishes_sets_franek/models/meal.dart';
import 'package:dishes_sets_franek/widget/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/const.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealSreen extends StatelessWidget {
  CategoryMealSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    var title = routArgs['title'] ?? '';
    final id = routArgs['id'] ?? '';
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
          color: kOrangeColor,
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
