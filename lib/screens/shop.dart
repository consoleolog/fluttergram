import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
final firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
class Shop extends StatefulWidget {
  Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {


  doRegister() async {
    try {
      var result = await auth.createUserWithEmailAndPassword(
          email: "test@test.com",
          password: "1111"
      );
      result.user?.updateDisplayName("john");
    }catch(err){
      print("회원가입 하면서 에러남 ${err}");
    }
  }


  doLogin() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: "test@test.com",
          password:  "1111"
      );
    }catch(err){
      print("로그인 하면서 에러남 ${err}");
    }
  }


  doLogout()async{
    try{
      await auth.signOut();
    }catch(err){
      print("로그아웃 하면서 에러남 ${err}");
    }
  }


  loginCheck(){
    if (auth.currentUser?.uid == null){
      print("로그인 안함");
    } else {
      print("로그인 했음");
    }
  }


  addData() async {
    await firestore.collection("product").add({
      'name':"힙한 바지",
      'price': 1000000
    });
  }


  deleteData() async {
    await firestore.collection("product").doc("").delete();
  }


  updateData()async{
    await firestore.collection("product").doc("").update({
      'name': '수정할 내용',
      'price': 1000
    });
  }


  getData() async {
    try {
      var result = await firestore.collection("product").get();
      if(result.docs.isEmpty){
          print("데이터 없음");
      }
    } catch(err){
      print("에러남 ${err}");
    }
  }


  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("샵 페이지임"),
    );
  }
}
