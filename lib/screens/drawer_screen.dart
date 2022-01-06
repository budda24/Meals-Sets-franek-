import 'package:dishes_sets_franek/consts/const.dart';
import 'package:dishes_sets_franek/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'filter_screean.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Widget drawerListTile(
      {required String title,
      required VoidCallback navigation,
      required IconData icon}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      decoration: BoxDecoration(
        color: kOrangeColor,
        border: Border.all(
          color: kBlueColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: ListTile(
        /*tileColor: kOrangeColor,*/
        leading: Icon(icon),
        title: Text(
          title,
          style: kTextSubTitle,
        ),
        trailing: const Icon(Icons.arrow_right_alt),
        onTap: navigation,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                    color: kOrangeColor,
                    border: Border.all(
                      color: kBlueColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  'Lets Find out !!!',
                  style: kTextMainTitle,
                ),
              ),
            ),
            drawerListTile(
                title: 'Category',
                navigation: () {
                  /*add push replacmet to avoid the memory leak by overbuilding the screen stack*/
                  Navigator.pushReplacementNamed(context, CategoriesScreen.id);
                },
                icon: Icons.category_rounded),
            const SizedBox(
              height: 20,
            ),
            drawerListTile(
                title: 'Filter',
                navigation: () {
                  Navigator.pushReplacementNamed(context, FilterScreean.id);
                },
                icon: Icons.filter_1_outlined),
          ],
        ),
      ),
    );
  }
}
