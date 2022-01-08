import 'package:dishes_sets_franek/consts/const.dart';
import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'drawer_screen.dart';
import 'favorite_screean.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  static const id = 'tabScreen';


  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {


  /*List of icons used for the drawer */
  final _myTabs = const [
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

/*list of routs for the drawer*/
  final List<Map<String, Object>> _routsList =  [
    {'rout': CategoriesScreen(), 'title': 'Categories'},
    {'rout': FavouriteScreen(), 'title': 'Favourite'},
  ];

/*  to change the index an use it in _routList*/
  int selectedTab = 0;
  void selectTab(int index){
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _routsList[selectedTab]['rout'] as Widget,
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: kBlueColor,
        selectedLabelStyle:kTextSubTitle,
        selectedItemColor: kOrangeColor,
        unselectedItemColor: kWhiteColor,
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
