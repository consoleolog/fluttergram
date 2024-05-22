import 'package:flutter/material.dart';
import 'package:fluttergram/firebase_options.dart';
import './service/store.dart';
import 'package:provider/provider.dart';
import './styles/theme.dart' as style;
import './screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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


