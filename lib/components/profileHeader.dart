import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
// GridView.builder(
// gridDelegate: gridDelegate,
// itemBuilder: (c,i){return Container(color: Colors.grey,);},
// itemCount: 3,
// )
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// CircleAvatar(
// radius: 30,
// backgroundColor: Colors.grey,
// ),
// Text("팔로워 ${context.watch<Stores>().follower.toString()} 명"),
// ElevatedButton(onPressed: (){
// context.read<Stores>().follow();
// }, child: Text("팔로우")),
// ],
// ),