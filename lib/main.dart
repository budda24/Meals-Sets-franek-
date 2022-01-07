
import 'package:dishes_sets_franek/dummy_data.dart';
import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/filter_screean.dart';
import '../screens/meals_screen.dart';
import '../consts/const.dart';
import '../screens/meal_details_screen.dart';
import '../screens/tab_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dishes Set Franek',
      color: kMainColor,
      initialRoute:TabScreen.id,
      routes: {
        TabScreen.id:(ctx)=> TabScreen(),
        CategoriesScreen.id:(ctx)=> const CategoriesScreen(),
        MealScreen.id: (ctx) =>   MealScreen(filters: filters),
        MealDetailsScreen.id: (ctx) =>  MealDetailsScreen(),
        FilterScreean.id: (ctx) =>  FilterScreean(filters: filters),

      },
    );
  }
}
