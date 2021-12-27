import 'package:dishes_sets_franek/consts/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categories_item.dart';
import 'dummy_data.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: const Center(
          child: Text(
            'Categories',
            style: kTextMainTitle,
          ),
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 3),
        children: [
          ...DUMMY_CATEGORIES.map((e) {
            return CategoryItem(color: e.color, title: e.title, id: e.id);
          }).toList(),
        ],
      ),
    );
  }
}
