import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Image.asset("assets/demo.jpg",width: 300,),
          Container(
            constraints: BoxConstraints(maxWidth: 600),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("likes 30"),
                Text("john kim"),
                Text("content.........."),
              ],
            ),
          )
        ],
      ),
    );
  }
}