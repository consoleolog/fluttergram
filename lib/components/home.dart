import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './userDetail.dart';
class Home extends StatefulWidget {
  Home({super.key,this.postData,this.addData});
  final postData;
  final addData;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var fetching = false;
  var scroll = ScrollController();
  var scrollState = 1;

  changeFetching(){
    setState(() {
      fetching = !fetching;
    });
  }
  increment(){
    setState(() {
      scrollState++;
    });
  }
  getMore() async {
    var response = await http.get(Uri.parse("https://codingapple1.github.io/app/more${scrollState}.json"));
    if (response.statusCode!=200){
    
    } else {
      var result = jsonDecode(response.body);
      if (result.isNotEmpty){
        widget.addData(result);
        increment();
      }
    }
    changeFetching();
  }
  @override
  void initState() {
    super.initState();
    scroll.addListener((){
      if (scroll.position.pixels == scroll.position.maxScrollExtent){
        changeFetching();
        if (fetching){
          getMore();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    if(widget.postData.isNotEmpty){
      return ListView.builder(
          itemCount: widget.postData.length,
          controller: scroll,
          itemBuilder: (c,i){
            return Column(
              children: [
                widget.postData[i]['image'].runtimeType==String ?
                Image.network(widget.postData[i]["image"].toString()) :
                Image.file(widget.postData[i]['image'],
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("likes ${widget.postData[i]["likes"].toString()}"),
                      GestureDetector(
                        child: Text(widget.postData[i]["user"]),
                        onTap: (){
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context)=>UserDetail()),
                            // PageRouteBuilder(
                            //   pageBuilder: (c,ao,a2)=>UserDetail(),
                            //   transitionsBuilder: (c,ao,a2,child)=>
                            //       // FadeTransition(opacity: ao,child:child)
                            //     SlideTransition(position: Tween(
                            //       begin: Offset(-1.0,0.0),
                            //       end: Offset(0.0,0.0),
                            //     ).animate(ao),
                            //     child: child,
                            //     )
                            // )
                          );
                        },
                      ),
                      Text(widget.postData[i]["date"]),
                      Text(widget.postData[i]["content"]),
                    ],
                  ),
                )
              ],
            );
          });
    } else {
      return CircularProgressIndicator();
    }
  }
}
