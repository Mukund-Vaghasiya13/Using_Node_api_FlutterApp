import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/Modle/Modle.dart';

import 'DecoractionAndComman.dart';
import 'LoginView/LoginView.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences? prefs;
  DataModle? items;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetData();
  }

  void GetData() async {
    prefs = await SharedPreferences.getInstance();
    String? Username;
    Username = prefs!.getString("Username");
    var json = await APiParshing().Getrequest(
        Url: "https://todo-api-3m2q.onrender.com/user/data/get/$Username");
    setState(() {
      items = DataModle.fromjson(json);
      print(items!.Task!);
    });
  }

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
        actions: [
          IconButton(
              onPressed: () {
                var TextData = "";
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Enter your task:"),
                        content: TextFormField(
                          decoration: DecoratedField.TextDesign(title: "Enter task",Lable: "Task"),
                          onChanged: (value) {
                            setState(() {
                              TextData = value;
                            });
                          },
                        ),
                        actions: [
                          TextButton(
                              onPressed: () async{
                                var mapOfData = {
                                  "id": items!.id.toString(),
                                  "Task": TextData.toString()
                                };
                                var json = await APiParshing().PostRequest(
                                    Url:
                                        "https://todo-api-3m2q.onrender.com/User/api/Post/task",
                                    e: mapOfData);
                                setState(() {
                                  items = DataModle.fromjson(json);
                                  print(items!.Task!);
                                });
                                Navigator.pop(context);
                              },
                              child: Text("Save"))
                        ],
                      );
                    });
              },
              icon: const Icon(CupertinoIcons.add))
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child: items == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: items?.Task!.length ?? 0,
                    itemBuilder: (context, i) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(items!.Task![i]),
                        ),
                      );
                    })),
      ),
      drawer: CoustomWidget(),
    );
  }
}

//Drawer
class CoustomWidget extends StatefulWidget {
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

  void initilization() async {
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
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          accountEmail: null,
          decoration: const BoxDecoration(color: Colors.black),
        ),
        ListTileTheme(
            child: TextButton(
          onPressed: () {
            prefs!.setBool("isLogin", false);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginView()));
          },
          child: const Row(
            children: [
              Icon(
                CupertinoIcons.person_badge_minus,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Log Out",
                style: TextStyle(fontSize: 20, color: Colors.black),
              )
            ],
          ),
        )),
        const Divider(),
        ListTileTheme(
            child: TextButton(
          onPressed: () {
            exit(0);
          },
          child: const Row(
            children: [
              Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Exit",
                style: TextStyle(fontSize: 20, color: Colors.black),
              )
            ],
          ),
        )),
        const Divider()
      ],
    ));
  }
}
