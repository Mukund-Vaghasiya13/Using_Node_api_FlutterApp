import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DecoractionAndComman.dart';
import '../Modle.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class MyLoginForm extends StatefulWidget {
  String? ButtonTitle;
  String? Endpoint;

  MyLoginForm({this.ButtonTitle, this.Endpoint});

  @override
  State<MyLoginForm> createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  var username = "";
  var password = "";

  var keys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keys,
      child: Column(
        children: [
          TextFormField(
            decoration: DecoratedField.TextDesign(
                title: "Enter username",
                Lable: "Username",
                e: TExtFieldType.notsecure,
                icon: const Icon(
                  CupertinoIcons.person,
                  color: Colors.black,
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return "Value is empety";
              }
            },
            onSaved: (newValue) {
              setState(() {
                username = newValue!;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: DecoratedField.TextDesign(
                title: "Enter password",
                Lable: "Password",
                e: TExtFieldType.secure),
            validator: (value) {
              if (value!.isEmpty) {
                return "Value is empety";
              }
            },
            onSaved: (newValue) {
              setState(() {
                password = newValue!;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          widget.ButtonTitle == "Login"
              ? TextButton(onPressed: () {}, child: Text("Forgote Password ?"))
              : SizedBox(
                  height: 5,
                ),
          SizedBox(
            height: 20,
          ),
          Material(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              onTap: () async {
                if (keys.currentState!.validate()) {
                  keys.currentState!.save();
                  var url = Uri.parse(widget.Endpoint ?? "");
                  var response = await http.post(url,
                      body: {"Username": username, "Password": password});
                  var json = jsonDecode(response.body);
                  print(json);
                }
              },
              child: Container(
                height: 40,
                width: 100,
                child: Center(
                  child: Text(
                    widget.ButtonTitle ?? "nil",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
