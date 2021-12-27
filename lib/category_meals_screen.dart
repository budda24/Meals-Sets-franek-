import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'consts/const.dart';

class CategoryMealSreen extends StatelessWidget {

 const CategoryMealSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    var title = routArgs['title'] ?? '';
    final id = routArgs['id'] ?? '';
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Center(
          child: Text(
            title,
            style: kTextMainTitle,
          ),
        ),
      ),
      body:Scaffold(
        body: Container(
          color: kOrangeColor,
          child: Text(id),
        ),
      ),
    );
  }


}
