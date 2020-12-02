import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ThemesScreen extends StatefulWidget {
  static const routeName = '/themes';
  final bool fromOnBoarding;

  ThemesScreen({this.fromOnBoarding = false});

  @override
  _ThemesScreenState createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  Future<bool> _onWillPop() {
    return Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => TabsScreen()));
  }

  Widget buildRadioListTile(
    ThemeMode themeVal,
    String txt,
    IconData icon,
    BuildContext ctx,
  ) {
    return RadioListTile(
      secondary: Icon(
        icon,
        color: Theme.of(ctx).buttonColor,
      ),
      value: themeVal,
      groupValue: Provider.of<ThemeProvider>(ctx, listen: true).tm,
      onChanged: (newThemeVal) {
        Provider.of<ThemeProvider>(ctx, listen: false)
            .themeModeChange(newThemeVal);
      },
      title: Text(txt),
    );
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Directionality(
        textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: Scaffold(
          appBar: widget.fromOnBoarding
              ? AppBar(
                  backgroundColor: Theme.of(context).canvasColor,
                  elevation: 0,
                )
              : AppBar(
                  title: Text(lan.getTexts('theme_appBar_title')),
                ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  lan.getTexts('theme_screen_title'),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        lan.getTexts('theme_mode_title'),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    buildRadioListTile(ThemeMode.light,
                        lan.getTexts('light_theme'), Icons.wb_sunny, context),
                    buildRadioListTile(
                        ThemeMode.dark,
                        lan.getTexts('dark_theme'),
                        Icons.brightness_3,
                        context),
                    buildListTile(context, lan.getTexts('accent')),
                    SizedBox(
                      height: widget.fromOnBoarding ? 80 : 0,
                    )
                  ],
                ),
              ),
            ],
          ),
          drawer: widget.fromOnBoarding ? null : MainDrawer(),
        ),
      ),
    );
  }

  ListTile buildListTile(BuildContext context, txt) {
    var primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;

    var accentColor =
        Provider.of<ThemeProvider>(context, listen: true).accentColor;
    return ListTile(
      title: Text(
        '$txt',
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: CircleAvatar(
        backgroundColor: txt == 'primary' ? primaryColor : accentColor,
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                elevation: 4,
                titlePadding: EdgeInsets.all(0.0),
                contentPadding: EdgeInsets.all(0.0),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: txt == 'primary'
                        ? Provider.of<ThemeProvider>(context, listen: true)
                            .primaryColor
                        : Provider.of<ThemeProvider>(context, listen: true)
                            .accentColor,
                    onColorChanged: (newColor) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .onChanged(newColor, txt == 'primary' ? 1 : 2);
                    },
                    colorPickerWidth: 300.0,
                    pickerAreaHeightPercent: 0.7,
                    enableAlpha: false,
                    displayThumbColor: true,
                    showLabel: false,
                  ),
                ),
              );
            });
      },
    );
  }
}
