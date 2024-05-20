import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import '../widgets/navbar.dart';
import './list.dart';
class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Navbar(),
      ),
      body: List(),
      bottomNavigationBar: Footer(),
    );
  }
}
