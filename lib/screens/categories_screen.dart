import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/const.dart';
import '../widget/categories_item.dart';
import '../dummy_data.dart';
import 'drawer_screen.dart';
import 'favorite_screean.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  static const id = 'categoriesScreen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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

  final List<Map<String, Object>> _routsList =  [
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
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: kBlueColor,
        selectedLabelStyle:kTextSubTitle,
        selectedItemColor: kOrangeColor,
        unselectedItemColor: kWhiteColor,
        items:_myTabs,
        currentIndex: selectedTab,
        onTap:selectTab,
      ),
      backgroundColor: kMainColor,
      drawer: DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBlueColor,
        title: const Text(
          'Categories',
          style: kTextMainTitle,
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


