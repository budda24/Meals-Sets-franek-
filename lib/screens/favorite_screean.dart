

import 'package:flutter/material.dart';

import '../consts/const.dart';
import 'drawer_screen.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavouriteScreen extends StatefulWidget {
   FavouriteScreen( {Key? key, this.favoriteMeals})  : super(key: key);

  static const id = 'favouriteScreen';
   List<Meal>? favoriteMeals;

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}



class _FavouriteScreenState extends State<FavouriteScreen> {

  /*function to delete element from fivoretes*/
  void _deleteItem(String id){
    setState(() {
      widget.favoriteMeals!.removeWhere((element) => element.id == id);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar:  AppBar(
        backgroundColor: kMainColor,
        title: Center(
          child: Text(
            'Favorite',
            style: kTextMainTitle,
          ),
        ),
      ),
      body: Scaffold(
        body: Container(
          color: kOrangeColor.withOpacity(0.6),
          child: ListView(
            children: [

              ...widget.favoriteMeals!.map((e) {
                return MealItem(
                  meal: e,deleteIteml:_deleteItem ,
                );
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
