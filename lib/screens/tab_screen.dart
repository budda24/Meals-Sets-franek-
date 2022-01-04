import 'package:dishes_sets_franek/consts/const.dart';
import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screean.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);
   var myTabs = const [
    Icon(
      Icons.category,
      color: kOrangeColor,
    ),
    Icon(
      Icons.favorite,
      color: kOrangeColor,
    ),
  ];
  static const id = 'tabScreen';

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 0.0),
            child: Container(
              child: TabBar(
                indicatorColor: kOrangeColor,
                tabs: widget.myTabs,
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
