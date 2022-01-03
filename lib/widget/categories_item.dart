import 'package:flutter/material.dart';

import '../consts/const.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.color, required this.title, required this.id})
      : super(key: key);

  final Color color;
  final String title;
  final String id;

  void selectCategory(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/categories-meals',
      arguments: {
        'title': title,
        'id': id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Container(
        decoration: kBoxLinearGradient.copyWith(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          gradient: LinearGradient(
            colors: [
              color,
              color.withOpacity(0.6),
            ],
          ),
        ),
        width: 200,
        height: 200,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: kTextSubTitle,
          ),
        ),
      ),
    );
  }
}
