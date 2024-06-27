import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = '/CategoriesScreen';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    DateTime? _lastPressedAt;
    return Directionality(
      textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: WillPopScope(
        onWillPop: () async {
          if (DateTime.now().difference(_lastPressedAt!) >
                  Duration(seconds: 1)) {
            Fluttertoast.showToast(
              fontSize: 15,
              msg: lan.getTexts("Tap back again to leave").toString(),
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              backgroundColor: Colors.black87,
              gravity: ToastGravity.BOTTOM,
            );
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Scaffold(
          body: GridView(
            padding: EdgeInsets.all(25),
            children: Provider.of<MealProvider>(context)
                .availableCategory
                .map(
                  (catData) => CategoryItem(
                    catData.id,
                    catData.color,
                  ),
                )
                .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
          ),
        ),
      ),
    );
  }
}
