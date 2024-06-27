import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final bool fromOnBoarding;

  FiltersScreen({this.fromOnBoarding = false});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    final Map<String, bool> currentFilters =
        Provider.of<MealProvider>(context, listen: false).filters;
    _glutenFree = currentFilters['gluten']!;
    _lactoseFree = currentFilters['lactose']!;
    _vegetarian = currentFilters['vegetarian']!;
    _vegan = currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool)? updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
      inactiveTrackColor:
          Provider.of<ThemeProvider>(context, listen: true).tm ==
                  ThemeMode.light
              ? null
              : Colors.black,
    );
  }

  Future<bool> _onWillPop() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => TabsScreen()));
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Directionality(
        textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(lan.getTexts('filters_appBar_title').toString()),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 0,
                  right: 0,
                  left: 10,
                ),
                child: Text(
                  lan.getTexts('Save').toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Builder(builder: (BuildContext ctx) {
                return IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.save),
                  onPressed: () {
                    final selectedFilters = {
                      'gluten': _glutenFree,
                      'lactose': _lactoseFree,
                      'vegan': _vegan,
                      'vegetarian': _vegetarian,
                    };
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters(selectedFilters);
                    ScaffoldMessenger.of(ctx).showSnackBar(new SnackBar(
                      content: new Text(
                        lan.getTexts('Saved successfully').toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      elevation: 2,
                      backgroundColor: Colors.greenAccent,
                      duration: Duration(seconds: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ));
                  },
                );
              }),
            ],
          ),
          drawer: MainDrawer(),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  lan.getTexts('filters_screen_title').toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    _buildSwitchListTile(
                      lan.getTexts('Gluten-free').toString(),
                      lan.getTexts('Gluten-free-sub').toString(),
                      _glutenFree,
                      (newValue) {
                        setState(
                          () {
                            _glutenFree = newValue;
                          },
                        );
                      },
                    ),
                    _buildSwitchListTile(
                      lan.getTexts('Lactose-free').toString(),
                      lan.getTexts('Lactose-free_sub').toString(),
                      _lactoseFree,
                      (newValue) {
                        setState(
                          () {
                            _lactoseFree = newValue;
                          },
                        );
                      },
                    ),
                    _buildSwitchListTile(
                      lan.getTexts('Vegetarian').toString(),
                      lan.getTexts('Vegetarian-sub').toString(),
                      _vegetarian,
                      (newValue) {
                        setState(
                          () {
                            _vegetarian = newValue;
                          },
                        );
                      },
                    ),
                    _buildSwitchListTile(
                      lan.getTexts('Vegan').toString(),
                      lan.getTexts('Vegan-sub').toString(),
                      _vegan,
                      (newValue) {
                        setState(
                          () {
                            _vegan = newValue;
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
