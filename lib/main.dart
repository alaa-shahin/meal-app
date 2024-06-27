import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/splash_screens.dart';
import 'package:meal_app/screens/theme_screen.dart';

import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import 'package:provider/provider.dart';
import './providers/meal_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MealProvider>(
          create: (ctx) => MealProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (ctx) => ThemeProvider(),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (ctx) => LanguageProvider(),
        ),
      ],
      child: SplashScreens(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var accentColor =
        Provider.of<ThemeProvider>(context, listen: true).accentColor;
    var tm = Provider.of<ThemeProvider>(context, listen: true).tm;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Recipes',
      themeMode: tm,
      theme: ThemeData(
        primarySwatch: primaryColor,
        colorScheme: ColorScheme.light(secondary: accentColor),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        cardColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            titleLarge: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      darkTheme: ThemeData(
        primarySwatch: primaryColor,
        colorScheme: ColorScheme.dark(secondary: accentColor),
        canvasColor: Color.fromRGBO(14, 22, 33, 1),
        fontFamily: 'Raleway',
        cardColor: Color.fromRGBO(35, 34, 39, 1),
        unselectedWidgetColor: Colors.white70,
        textTheme: ThemeData.dark().textTheme.copyWith(
            bodyLarge: TextStyle(
              color: Colors.white,
            ),
            titleLarge: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/',
      // default is '/'
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
        ThemesScreen.routeName: (ctx) => ThemesScreen(),
      },
    );
  }
}
