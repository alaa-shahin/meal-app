import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Future<bool> _onWillPop() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => TabsScreen()));
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);

    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var dw = MediaQuery.of(context).size.width;

    final List<Meal> favoriteMeals =
        Provider.of<MealProvider>(context, listen: true).favoriteMeals;
    if (favoriteMeals.isEmpty) {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Center(
          child: Text(lan.getTexts('favorites_text').toString()),
        ),
      );
    } else {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: dw <= 400 ? 400 : 500,
            childAspectRatio: isLandScape ? dw / (dw * 0.8) : dw / (dw * 0.75),
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
            );
          },
          itemCount: favoriteMeals.length,
        ),
      );
    }
  }
}
