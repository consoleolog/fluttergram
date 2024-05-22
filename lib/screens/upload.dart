import 'package:flutter/material.dart';

class Upload extends StatelessWidget {
  Upload({super.key,this.image});
  final image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Container(
        child: Column(
          children: [
            Image.file(image),
            TextField(),
            ElevatedButton(onPressed: (){}, child: Text("등록"))
          ],
        ),
      ),
    );
  }
}
