import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../widgets/post.dart';
import 'dart:convert';
class List extends StatefulWidget {
  List({super.key});

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  var postData = [];
  bool fetching = false;
  changeFetching(){
    fetching = !fetching;
  }
  getList() async {
    var response = await http.get(Uri.parse("https://codingapple1.github.io/app/data.json"));
    if (response.statusCode==200){
      setState(() {
        postData = jsonDecode(response.body);
      });
    }
  }
  @override
  void initState() {
    super.initState();
    changeFetching();
    if(fetching){
      getList();
      changeFetching();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: postData.length,
        itemBuilder: (c,i){
          return postData.isEmpty ? Container() : Post(postData:postData[i]);
        });
  }
}
