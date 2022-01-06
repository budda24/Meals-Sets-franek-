import 'package:dishes_sets_franek/consts/const.dart';

import 'package:flutter/material.dart';

import 'drawer_screen.dart';

class FilterScreean extends StatefulWidget {
  const FilterScreean({Key? key}) : super(key: key);
  static const id = 'filterScreean';

  @override
  _FilterScreeanState createState() => _FilterScreeanState();
}

class _FilterScreeanState extends State<FilterScreean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: kBlueColor,
        centerTitle: true,
        title: const Text(
          'Filter',
          style: kTextMainTitle,
        ),
      ),
      drawer: DrawerWidget(),
      body: Center(child: Text('jjkk')),
    );
  }
}
