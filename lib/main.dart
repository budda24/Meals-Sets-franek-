import 'package:dishes_sets_franek/dummy_data.dart';
import 'package:dishes_sets_franek/models/meal.dart';
import 'package:dishes_sets_franek/screens/favorite_screean.dart';
import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/filter_screean.dart';
import '../screens/meals_screen.dart';
import '../consts/const.dart';
import '../screens/meal_details_screen.dart';
import '../screens/tab_screen.dart';
import 'dummy_data.dart';
import 'models/filters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters filters = Filters(false, false, false, false);
  List<Meal> favoritMeals = [];

  /*callback functiont passed to details meal*/
  void toggleFavorites(String id) {
    int index = DUMMY_MEALS.indexWhere((element) => element.id == id);
    if(favoritMeals.length == 0){
      /*adding element to the empty list*/
        favoritMeals.add(DUMMY_MEALS[index]);
    }else{
      if(!favoritMeals.contains(DUMMY_MEALS[index])) {
        favoritMeals.add(DUMMY_MEALS[index]);
      }

    }
  }

  void unFavorite(String id){
    int index = favoritMeals.indexWhere((element) => element.id == id);
    favoritMeals.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dishes Set Franek',
      color: kMainColor,
      initialRoute: CategoriesScreen.id,
      routes: {
        /*TabScreen.id: (ctx) => TabScreen(),*/
        CategoriesScreen.id: (ctx) => const CategoriesScreen(),
        MealScreen.id: (ctx) => MealScreen(filters: filters),
        MealDetailsScreen.id: (ctx) =>
            MealDetailsScreen(toggleFavorites: toggleFavorites, unFavorite: unFavorite,),
        FilterScreean.id: (ctx) => FilterScreean(filters: filters),
        FavouriteScreen.id: (ctx) => FavouriteScreen(favoriteMeals:favoritMeals),
      },
    );
  }
}
