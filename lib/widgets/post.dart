import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/profile.dart';
class Post extends StatelessWidget {
  Post({Key?key,this.postData,}):super(key:key);
  final postData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
         Image.network(postData['image']),
          Container(
            constraints: BoxConstraints(maxWidth: 600),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("likes ${postData['likes'].toString()}"),
                GestureDetector(
                  child: Text(postData['user']),
                  onTap: (){
                    Navigator.push(context,
                      CupertinoPageRoute(builder:(c)=>Profile())
                    );
                  },
                ),
                Text("content.........."),
              ],
            ),
          )
        ],
      ),
    );
  }
}