import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/post.dart';
import '../service/store.dart';
import '../service/postservice.dart' as post_service;
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
  @override
  void initState() {
    super.initState();
    changeFetching();
    if(fetching){
      setState(() {
        postData = post_service.getList();
      });
      changeFetching();
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (c,i){
          return Post();
        });
  }
}
