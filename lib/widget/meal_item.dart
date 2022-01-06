import 'dart:ffi';

import 'package:dishes_sets_franek/screens/meal_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dishes_sets_franek/models/meal.dart';
import '../consts/const.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function deleteIteml;

  const MealItem({
    Key? key,
    required this.meal,
    required this.deleteIteml,
  }) : super(key: key);

  /* dinamicly converting enums from dummy_data to string interpretation*/
  get affordability {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Afordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Expensive';
      default:
        return "null";
    }
  }

  get complexity {
    switch (meal.complexity) {
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      case Complexity.simple:
        return 'simple';
      default:
        'null';
    }
  }

/*assing meeal object to the meal detail screen*/
  void selectMeal(BuildContext context) {
    Navigator.pushNamed(
      context,
      MealDetailsScreen.id,
      /*passing map of arguments to MealDetailsScreen*/
      arguments: {'meal': meal, 'deleteFunction': deleteIteml},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 350,
          width: 350,
          child: Stack(
            children: [
              Container(
                height: 288,
                width: 384,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 250,
                right: 10,
                child: Container(
                  color: Colors.white70,
                  child: Text(
                    meal.title,
                    style: kTextMainTitle,
                  ),
                ),
              ),
              Positioned(
                top: 290,
                height: 62,
                width: 384,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        Text(
                          meal.duration.toString(),
                          style: kTextSubTitle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.accessibility),
                        Text(
                          complexity,
                          style: kTextSubTitle,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.account_balance_wallet_rounded),
                        Text(
                          complexity,
                          style: kTextSubTitle,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
