import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Upload extends StatelessWidget {
  Upload({super.key,this.userImage,this.setUserContent,this.post});
  final setUserContent;
  final userImage;
  final post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            post();
            }, icon: Icon(Icons.send))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(userImage),
          TextField(
            onChanged:(content){
              setUserContent(content);
              },
          ),
          IconButton(onPressed: (){
            Navigator.pop(context);
            }, icon: Icon(Icons.close))
        ],
      ),
    );
  }
}
