import 'package:flutter/material.dart';

var theme = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
      elevation: 2,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
          color: Colors.black
      ),
    )

);