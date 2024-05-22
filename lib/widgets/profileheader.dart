import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/store.dart';
class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
        ),
        Text("팔로워 0명"),
        ElevatedButton(onPressed: (){
          context.read<Store>().getData();},
          child: Text("사진 가져 오기;"),),
      ]
    );
  }
}
