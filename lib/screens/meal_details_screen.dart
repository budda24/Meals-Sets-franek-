import 'package:dishes_sets_franek/consts/const.dart';
import 'package:dishes_sets_franek/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    Key? key,
  }) : super(key: key);
  static const id = 'mealDetailsScreen';

  Widget scroledItemBox({required Widget child}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green)),
      width: 250,
      height: 150,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Center(
          child: Text(
            routArgs.title,
            style: kTextMainTitle,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              child: Image.network(
                routArgs.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              routArgs.title,
              textAlign: TextAlign.center,
              style: kTextMainTitle,
            ),
            scroledItemBox(
              child: ListView(
                children: [
                  ...routArgs.ingredients.map((e) {
                    return Container(
                      decoration: BoxDecoration(
                          color: kOrangeColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.green)),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text(
                        '*$e',
                        style: kTextSubTitle,
                      ),
                    );
                  }).toList()
                ],
              ),
            ),
            scroledItemBox(
              child: ListView(
                children: [
                  ...List.generate(
                    routArgs.steps.length,
                    (index) => ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          index.toString(),
                          style: kTextMainTitle,
                        ),
                      ),
                      title: Text(routArgs.steps[index]),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
