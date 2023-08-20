import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginView/LoginView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          "Task",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.add))],
      ),
      body: const SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [],
          ),
        ),
      ),
      drawer: const CoustomWidget(),
    );
  }
}

//
class CoustomWidget extends StatefulWidget {
  const CoustomWidget({
    super.key,
  });

  @override
  State<CoustomWidget> createState() => _CoustomWidgetState();
}

class _CoustomWidgetState extends State<CoustomWidget> {
  SharedPreferences? prefs;
  String? Username;
  @override
  void initState() {
    super.initState();
    initilization();
  }

  void initilization()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
         Username = prefs!.getString("Username");
    });
    print(Username);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Hi $Username",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            accountEmail: null,
            decoration: const BoxDecoration(color: Colors.black),
          ),
          ListTileTheme(child: TextButton(
            onPressed: (){
              prefs!.setBool("isLogin", false);
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginView()));
            },
            child: const Row(
              children: [
                Icon(CupertinoIcons.person_badge_minus,color: Colors.black,),
                SizedBox(width: 10,),
                Text("Log Out",style: TextStyle(fontSize: 20,color: Colors.black),)
              ],
            ),
          )),
          const Divider(),
           ListTileTheme(child: TextButton(
            onPressed: (){
              exit(0);
            },
            child: const Row(
              children: [
                Icon(Icons.exit_to_app,color: Colors.black,),
                SizedBox(width: 10,),
                Text("Exit",style: TextStyle(fontSize: 20,color: Colors.black),)
              ],
            ),
          )),
         const Divider()
        ],
      )
    );
  }
}
