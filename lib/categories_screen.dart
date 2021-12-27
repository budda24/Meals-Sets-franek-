import 'package:dishes_sets_franek/consts/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 3 / 3),
          itemCount: DUMMY_CATEGORIES.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: kBoxLinearGradient.copyWith(
                  gradient: LinearGradient(colors: [
                DUMMY_CATEGORIES[index].color,
                DUMMY_CATEGORIES[index].color.withOpacity(0.6),
              ])),
              width: 200,
              height: 200,
              child: Center(
                child: Text(
                  DUMMY_CATEGORIES[index].title,
                  textAlign: TextAlign.center,
                  style: kTextSubTitle,
                ),
              ),
            );
          }),
    );
  }
}
