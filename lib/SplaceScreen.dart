import 'dart:async';

import 'package:flutter/material.dart';


import 'LoginView/LoginView.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginView()));
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