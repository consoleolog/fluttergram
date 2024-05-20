import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatelessWidget {
  Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Fluttergram'),
      actions: [
        IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.bars))
      ],
    );
  }
}
