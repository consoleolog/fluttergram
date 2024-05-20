import 'package:flutter/material.dart';
import 'package:fluttergram/store/stores.dart';
import 'package:provider/provider.dart';
import './footer.dart';
import './navbar.dart';
class UserDetail extends StatelessWidget {
  UserDetail({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Navbar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                ),
                Text("팔로워 ${context.watch<Stores>().follower.toString()} 명"),
                ElevatedButton(onPressed: (){
                  context.read<Stores>().follow();
                  }, child: Text("팔로우")),
                ElevatedButton(onPressed: (){
                  context.read<Stores>().getData();
                  print(context.watch<Stores>().profileImage);
                  }, child: Text("사진 가져오기")),
              ],
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: context.watch<Stores>().profileImage.length,
                  (c,i){
                    if (context.watch<Stores>().profileImage.isNotEmpty){
                      return Container(
                        child: Image.network(context.watch<Stores>().profileImage[i]),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
