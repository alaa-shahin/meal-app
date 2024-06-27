import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/screens/theme_screen.dart';
import 'package:provider/provider.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildListTile(
      String title, IconData icon, Function()? tapHandler, BuildContext ctx) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(ctx).textTheme.bodyLarge!.color,
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
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
        child: Drawer(
          elevation: 0,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 120,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  alignment:
                      lan.isEn ? Alignment.centerLeft : Alignment.centerRight,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    lan.getTexts('drawer_name').toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildListTile(
                    lan.getTexts('drawer_item1').toString(), Icons.restaurant,
                    () {
                  Navigator.of(context)
                      .pushReplacementNamed(TabsScreen.routeName);
                }, context),
                buildListTile(
                    lan.getTexts('drawer_item2').toString(), Icons.settings,
                    () {
                  Navigator.of(context)
                      .pushReplacementNamed(FiltersScreen.routeName);
                }, context),
                buildListTile(
                    lan.getTexts('drawer_item3').toString(), Icons.color_lens,
                    () {
                  Navigator.of(context)
                      .pushReplacementNamed(ThemesScreen.routeName);
                }, context),
                Divider(
                  height: 10,
                  color: Colors.black54,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(top: 20, right: 22),
                  child: Center(
                    child: Text(
                      lan.getTexts('drawer_switch_title').toString(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: (lan.isEn ? 0 : 20), left: (lan.isEn ? 20 : 0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(lan.getTexts('drawer_switch_item2').toString()),
                      Switch(
                        value:
                            Provider.of<LanguageProvider>(context, listen: true)
                                .isEn,
                        onChanged: (newValue) {
                          Provider.of<LanguageProvider>(context, listen: false)
                              .changeLan(newValue);
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        lan.getTexts('drawer_switch_item1').toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
