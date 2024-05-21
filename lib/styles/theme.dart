import 'package:flutter/material.dart';

var theme = ThemeData(
    appBarTheme: AppBarTheme(
        color: Colors.white,
        
        elevation: 2,
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 25),
        actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    // textTheme: TextTheme(
    //     bodyText2 : TextStyle(color: Colors.red),
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 2,
        selectedItemColor: Colors.black
    )
);