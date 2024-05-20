import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Stores extends ChangeNotifier {
  var name = "john kim";
  var follower = 0;
  var followCheck = false;
  var profileImage = [];
  doFollow(){
    followCheck = true;
    follower++;
    notifyListeners();
  }
  unFollow(){
    followCheck = false;
    follower--;
    notifyListeners();
  }
  changeName(){
    name = "sung park";
    notifyListeners(); // 재 랜더링 ㄱㄱ
  }
  follow(){
    if (followCheck==false){
      follower++;
      followCheck=true;
    } else if(followCheck ==true){
      follower--;
      followCheck=false;
    }
    notifyListeners();
  }
  getData() async {
    var response = await http.get(Uri.parse('https://codingapple1.github.io/app/profile.json'));
    if (response.statusCode==200){
      var result = jsonDecode(response.body);
      profileImage = result;
      notifyListeners();
    }
  }
}