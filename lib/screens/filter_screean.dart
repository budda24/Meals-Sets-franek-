import 'package:dishes_sets_franek/consts/const.dart';
import 'package:dishes_sets_franek/models/filters.dart';

import 'package:flutter/material.dart';

import 'drawer_screen.dart';

class FilterScreean extends StatefulWidget {
  FilterScreean({Key? key, required this.filters}) : super(key: key);
  static const id = 'filterScreean';
  Filters filters;

  @override
  _FilterScreeanState createState() => _FilterScreeanState();
}

class _FilterScreeanState extends State<FilterScreean> {
  Widget _buildSwitchTile(String title, bool boolvalue, void function(value)) {
    return SwitchListTile(
      title: Text(
        title,
        style: kTextSubTitle,
      ),
      value: boolvalue,
      onChanged: function,
    );
  }

  /*late bool isGlutenFree;
  late bool isVegan;
  late bool isVegetarian;
  late bool isLactoseFree;

  @override
  void initState() {
     isGlutenFree = widget.filters.isGlutenFree;
     isVegan = widget.filters.isVegan;
     isVegetarian = widget.filters.isVegetarian;
     isLactoseFree = widget.filters.isLactoseFree;
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        centerTitle: true,
        title: const Text(
          'Filter',
          style: kTextMainTitle,
        ),
      ),
      drawer: DrawerWidget(),
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
