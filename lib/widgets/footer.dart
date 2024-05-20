import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: [
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house),label: 'home'),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.squarePlus),label: 'upload'),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.circleUser),label: 'profile')
      ],
    );
  }
}