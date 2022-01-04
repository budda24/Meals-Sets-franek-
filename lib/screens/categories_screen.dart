import 'package:dishes_sets_franek/consts/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/categories_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  static const id = 'categoriesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
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
