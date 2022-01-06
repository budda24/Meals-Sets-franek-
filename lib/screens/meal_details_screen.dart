import 'package:dishes_sets_franek/consts/const.dart';
import 'package:dishes_sets_franek/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  /*final Function deleteIteml;*/
  
  const MealDetailsScreen({
    Key? key,
    /*required this.deleteIteml*/
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
    /*accessing the arguments passed with the Navigator.pushNamed(context, MealDetailsScreen.id, arguments: {'meal':meal, 'deleteFunction': deleteIteml} in meal item*/
    final routArgs = ModalRoute.of(context)!.settings.arguments as Map;
    /*assigning meal passed from the meals_screean*/
    var meal = routArgs['meal'] as Meal;
    /*assigning delete function passed from the meals_screean*/
    var deleteFunction = routArgs['deleteFunction'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Center(
          child: Text(
            meal.title,
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
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              meal.title,
              textAlign: TextAlign.center,
              style: kTextMainTitle,
            ),
            scroledItemBox(
              child: ListView(
                children: [
                  ...meal.ingredients.map((e) {
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
                    meal.steps.length,
                    (index) => ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          index.toString(),
                          style: kTextMainTitle,
                        ),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){
          deleteFunction(meal.id);
          Navigator.of(context).pop(meal.id);
        },
        child: const CircleAvatar(
          backgroundColor: kOrangeColor,
          child: Icon(
            Icons.remove_done,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
