import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/store.dart';

class UserPost extends StatelessWidget {
  UserPost({super.key,this.userPost});
  final userPost;
  @override
  Widget build(BuildContext context) {
    return userPost == null ? Container()
        : Container(
           child: Image.network(userPost),
    );
  }
}
