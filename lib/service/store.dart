import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Store extends ChangeNotifier {

  var postData = [];

  getList() async {
    var response = await http.get(Uri.parse("https://codingapple1.github.io/app/data.json"));
    if (response.statusCode==200){
      postData = jsonDecode(response.body);
      notifyListeners();
    }
  }
}