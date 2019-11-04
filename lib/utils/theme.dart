import 'package:flutter/material.dart';

///value is for different theme that our app can have . Value can be 1 or 2 .
///darkmode will check if user uses a light or dark mode

//int value,bool darkmode
ThemeData basicTheme(int value, bool darkMode) {
  TextTheme _basicTextTheme(TextTheme base, bool darkMode) {
    return base.copyWith(
      headline: base.headline.copyWith(
        fontFamily: "McLaren",
        fontSize: 24.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      title: base.title.copyWith(
        fontFamily: "McLaren",
        fontSize: 16.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      display1: base.display1.copyWith(
        fontFamily: "McLaren",
        fontSize: 16.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      display2: base.display2.copyWith(
        fontFamily: "McLaren",
        fontSize: 14.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      display3: base.display3.copyWith(
        fontFamily: "McLaren",
        fontSize: 12.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      display4: base.display4.copyWith(
        fontFamily: "McLaren",
        fontSize: 10.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      body1: base.body1.copyWith(
        fontFamily: "McLaren",
        fontSize: 12.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      body2: base.body2.copyWith(
        fontFamily: "McLaren",
        fontSize: 14.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      subhead: base.subhead.copyWith(
        fontFamily: "McLaren",
        fontSize: 16.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      subtitle: base.subtitle.copyWith(
        fontFamily: "McLaren",
        fontSize: 18.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      caption: base.caption.copyWith(
        fontFamily: "McLaren",
        fontSize: 12.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      overline: base.overline.copyWith(
        fontFamily: "McLaren",
        fontSize: 12.0,
        color: darkMode ? Colors.white : Colors.black,
      ),
      button: base.button.copyWith(
        fontFamily: "McLaren",
        fontSize: 12.0,
        color: darkMode ? Colors.red : Colors.yellow,
      ),
    );
  }

  final ThemeData base = ThemeData();

  return base.copyWith(
    //custom text theme
    textTheme: _basicTextTheme(base.textTheme, darkMode),

    ///already defined text theme
    // textTheme: darkMode?Typography.whiteCupertino:Typography.blackMountainView,

    iconTheme: darkMode
        ? IconThemeData(
            color: Colors.white,
            size: 20.0,
          )
        : IconThemeData(
            color: Colors.black,
            size: 20.0,
          ),

    primaryColor: value == 1
        ? (darkMode ? Colors.black : Colors.blue)
        : (darkMode ? Colors.black : Colors.pink),

    accentColor: value == 1
        ? (darkMode ? Colors.black : Colors.orangeAccent)
        : (darkMode ? Colors.black : Colors.lightBlueAccent),

    brightness: darkMode ? Brightness.dark : Brightness.light,

    scaffoldBackgroundColor: darkMode ? Colors.grey : Colors.white,

    
  );
}
