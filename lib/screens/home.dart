import 'package:flutter/material.dart';
import './upload.dart';
import '../widgets/footer.dart';
import '../widgets/navbar.dart';
import './list.dart';
import './shop.dart';
class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tab = 0;
  changeTab(i){
    setState(() {
      tab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Navbar(),
      ),
      body: [List(),Shop(),Container(child: Text("프로필페이지"),)][tab],
      bottomNavigationBar: Footer(changeTab:changeTab,),
    );
  }
}
