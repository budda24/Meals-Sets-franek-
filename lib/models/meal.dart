/*import 'package:flutter/foundation.dart';*/
enum Complexity {
  simple,
  challenging,
  hard,
}
enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final int duration;
  bool isFavorite ;

  final List<String> steps;

  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

   Meal({
    this.isFavorite = false,
    required this.duration,
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
