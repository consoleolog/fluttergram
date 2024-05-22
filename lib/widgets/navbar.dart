import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../screens/upload.dart';
class Navbar extends StatefulWidget {
  Navbar({super.key,});


  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  var userImage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Fluttergram'),
      actions: [
        IconButton(onPressed: () async {
          var picker = ImagePicker();
          var image = await picker.pickImage(source: ImageSource.gallery);
          if(image!=null){
            setState(() {
              userImage = File(image.path);
              Navigator.push(context,
                  MaterialPageRoute(builder: (c)=>Upload(image:userImage))
              );
            });
          }
        }, icon: FaIcon(FontAwesomeIcons.bars))
      ],
    );
  }
}
