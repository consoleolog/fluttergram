import 'package:flutter/material.dart';
import 'package:fluttergram/store/stores.dart';
import 'package:provider/provider.dart';
import './components/home.dart';
import './components/navbar.dart';
import './components/footer.dart';
import './components/shop.dart';
import './styles/theme.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';
import './notification.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (c)=>Stores(),
        child: MaterialApp(home: MyApp(),theme:style.theme),
      )
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tabState = 0;
  var postData = [];
  var fetching = false;

  changeFetching(){
    setState(() {
      fetching = !fetching;
    });
  }
  saveData() async {
    var response = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result = jsonDecode(response.body);
    if (response.statusCode!=200) {
      setState(() {
        postData = [];
      });
    } else {
      setState(() {
        postData = result;
      });
    }
    changeFetching();
  }
  addData(data){
    setState(() {
      postData.add(data);
    });
  }
  changeTabState(tab){
    setState(() {
      tabState = tab;
    });
  }
  @override
  void initState() {
    super.initState();
    initNotification(context);
    changeFetching();
    if (fetching){
      saveData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Text("+"),onPressed: (){
        showNotification();
        },),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Navbar(addData:addData,postData:postData),
      ),
      body: [Home(postData:postData,addData:addData),Shop()][tabState],
      bottomNavigationBar: Footer(changeTabState : changeTabState),
    );
  }
}


