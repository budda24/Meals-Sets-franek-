import 'package:dishes_sets_franek/categories_screen.dart';
import 'package:dishes_sets_franek/consts/const.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Dishes Set Franek',
      color: kMainColor,
      home:  Categories(),
    );
  }
}


