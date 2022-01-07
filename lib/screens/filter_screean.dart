

import 'package:flutter/material.dart';

import 'drawer_screen.dart';
import '../consts/const.dart';
import '../models/filters.dart';
import '../screens/categories_screen.dart';

class FilterScreean extends StatefulWidget {
  FilterScreean({Key? key, required this.filters}) : super(key: key);
  static const id = 'filterScreean';
  Filters filters;

  @override
  _FilterScreeanState createState() => _FilterScreeanState();
}

class _FilterScreeanState extends State<FilterScreean> {

  /*method to build swich tile*/
  Widget _buildSwitchTile(String title, bool boolvalue, void function(value)) {
    return SwitchListTile(
      activeColor: kOrangeColor,
      inactiveThumbColor: kOrangeColor,
      title: Text(
        title,
        style: kTextSubTitle,
      ),
      value: boolvalue,
      onChanged: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(CategoriesScreen.id);
          }, icon: Icon(Icons.save),)
        ],
        elevation: 4,
        backgroundColor: kBlueColor,
        centerTitle: true,
        title: const Text(
          'Filter',
          style: kTextMainTitle,
        ),
      ),
      drawer: DrawerWidget(),
      /*floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Icon(Icons.save),*/
      body: Column(
        children: [
          _buildSwitchTile(
            'Is Gluten Free',
              widget.filters.isGlutenFree,
              (value){
              setState(() {
                widget.filters.isGlutenFree = value;
              });
              }
          ),
          _buildSwitchTile(
            'Is Vegan',
            widget.filters.isVegan,
                  (value){
                setState(() {
                  widget.filters.isVegan = value;
                });
              }
          ),
          _buildSwitchTile(
            'Is Lactose Free',
            widget.filters.isLactoseFree,
                  (value){
                setState(() {
                  widget.filters.isLactoseFree = value;
                });
              }

          ),
          _buildSwitchTile(
            'Is Vegetarian',
            widget.filters.isVegetarian,
                  (value){
                setState(() {
                  widget.filters.isVegetarian = value;
                });
              }
          ),
        ],
      ),
    );
  }
}
