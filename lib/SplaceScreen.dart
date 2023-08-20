import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/homeScreen.dart';


import 'LoginView/LoginView.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
   SharedPreferences? prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoginNAvigate();
  }

  void LoginNAvigate()async{
     prefs = await SharedPreferences.getInstance();
    var login = prefs!.getBool("isLogin");
    Timer(Duration(seconds: 3), (){
      if(login ?? false){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginView()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image.network("https://t4.ftcdn.net/jpg/03/24/93/39/360_F_324933938_Mj4Xb6S1wze7mTvJ8H4cgayQW1ktZukl.jpg"),
      ),
      backgroundColor: Colors.white,
    );
  }
}