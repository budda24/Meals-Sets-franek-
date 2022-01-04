import 'package:dishes_sets_franek/consts/const.dart';
import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screean.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  static const id = 'tabScreen';





  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var _myTabs = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.category,
          color: kOrangeColor,
        ),
        label: 'Category'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          color: kOrangeColor,
        ),
        label: 'Favourite'
    ),
  ];


  final List<Map<String, Object>> _routsList = const [
    {'rout': CategoriesScreen(), 'title': 'Categories'},
    {'rout': FavouriteScreen(), 'title': 'Favourite'},
  ];

  int selectedTab = 0;
  void selectTab(int index){
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        centerTitle: true,
        title: Text(
          _routsList[selectedTab]['title'] as String,
          style: kTextMainTitle,
        ),
      ),
      body: _routsList[selectedTab]['rout'] as Widget,
      bottomNavigationBar:BottomNavigationBar(
        items:_myTabs,
        currentIndex: selectedTab,
        onTap:selectTab,
      ),
    );
  }
}
/*DefaultTabController(
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
    );*/
