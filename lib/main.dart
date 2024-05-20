import 'package:flutter/material.dart';
import './service/store.dart';
import 'package:provider/provider.dart';
import './styles/theme.dart' as style;
import './screens/home.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (c)=>Store(),
      child:  MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: style.theme,
      home:Home(),
    );
  }
}
