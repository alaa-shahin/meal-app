import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildContainer(Widget child, context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var dw = MediaQuery.of(context).size.width;
    var dh = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      height: isLandScape ? dh * 0.5 : dh * 0.20,
      width: isLandScape ? (dw * 0.5 - 30) : dw,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);

    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    var accentColor = Theme.of(context).accentColor;
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    List<String> stepsLi = lan.getTexts('steps-$mealId') as List<String>;
    var liSteps = ListView.builder(
      padding: EdgeInsets.all(0),
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('# ${(index + 1)}'),
            ),
            title: Text(
              stepsLi[index],
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Divider()
        ],
      ),
      itemCount: stepsLi.length,
    );
    List<String> liIngredientLi =
        lan.getTexts('ingredients-$mealId') as List<String>;
    var liIngredients = ListView.builder(
      padding: EdgeInsets.all(0),
      itemBuilder: (ctx, index) => Card(
        color: accentColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Text(
            liIngredientLi[index],
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      itemCount: liIngredientLi.length,
    );
    return Directionality(
      textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  lan.getTexts('meal-$mealId'),
                  style: TextStyle(color: Colors.white),
                ),
                background: Hero(
                  tag: mealId,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/a2.png'),
                    image: NetworkImage(
                      selectedMeal.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  if (isLandScape)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            buildSectionTitle(
                                context, lan.getTexts('Ingredients')),
                            buildContainer(liIngredients, context),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            buildSectionTitle(context, lan.getTexts('Steps')),
                            buildContainer(liSteps, context),
                          ],
                        ),
                      ],
                    ),
                  if (!isLandScape)
                    buildSectionTitle(context, lan.getTexts('Ingredients')),
                  if (!isLandScape) buildContainer(liIngredients, context),
                  if (!isLandScape)
                    buildSectionTitle(context, lan.getTexts('Steps')),
                  if (!isLandScape) buildContainer(liSteps, context),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Provider.of<MealProvider>(context, listen: true).isFavorite(mealId)
                ? Icons.star
                : Icons.star_border,
          ),
          onPressed: () => Provider.of<MealProvider>(context, listen: false)
              .toggleFavorite(mealId),
        ),
      ),
    );
  }
}
