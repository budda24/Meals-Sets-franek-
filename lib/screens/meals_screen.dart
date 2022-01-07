import 'package:dishes_sets_franek/models/filters.dart';
import 'package:dishes_sets_franek/models/meal.dart';
import 'package:dishes_sets_franek/widget/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/const.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class MealScreen extends StatefulWidget {
 const MealScreen({Key? key, required this.filters}) : super(key: key);

 final Filters filters;

  static var id = 'categoryMealScreen';

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override

  var firstInit = false;
  late List<Meal> categoryMeals;
  late List<Meal> displayedMeals;



  /*callbacked passed to the detail meals for deletion*/
  void deleteItem(String id){
    setState(() {
      displayedMeals.removeWhere((element) => element.id == id);
    });

  }

  @override
  Widget build(BuildContext context) {
    /*defining what the args passed in CategoryItem are and using them*/
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    /*initialization of the meals only by the first time*/
      if(!firstInit){
        /* creating new list containing only meals with id passed from categories screen*/
        categoryMeals = DUMMY_MEALS
            .where((element) => element.categories.contains(routArgs['id']))
            .toList();
        firstInit = true;

        /*going true the meals and sorting with filters*/
        displayedMeals = categoryMeals.where((element) {
        if(widget.filters.isLactoseFree == true && element.isLactoseFree != true){
          return false;
          }
        if(widget.filters.isVegetarian == true && element.isVegetarian != true){
            return false;
          }

        if(widget.filters.isVegan == true && element.isVegan != true){
            return false;
          }
        if(widget.filters.isGlutenFree == true && element.isGlutenFree != true){
            return false;
          }else{
            return true;
          }
        }).toList();
      }

   /* ?? to avoid null safty means when null asign ""*/
    var title = routArgs['title'] ?? '';
    /*final id = routArgs['id'] ?? '';*/




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
              ...displayedMeals.map((e) {
                return MealItem(
                  meal: e, deleteIteml: deleteItem,
                );
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
