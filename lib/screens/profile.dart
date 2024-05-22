import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/navbar.dart';
import '../service/store.dart';
import '../widgets/profileheader.dart';
import '../widgets/userpost.dart';
class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    print(context.watch<Store>().userPosts);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Navbar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProfileHeader(),
          ),
          SliverGrid(delegate: SliverChildBuilderDelegate(
              childCount: context.watch<Store>().userPosts.length,
              (c,i) => UserPost(userPost:context.watch<Store>().userPosts[i])
          ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
        ],
      )
    );
  }
}
