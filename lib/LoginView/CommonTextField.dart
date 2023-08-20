
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/homeScreen.dart';
import '../DecoractionAndComman.dart';
import '../Modle/Modle.dart';



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
  SharedPreferences? prefs;

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
              return null;
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
              return null;
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
                  LoginAndsinupLogic();
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

  void LoginAndsinupLogic() async {
    var json = await APiParshing().PostRequest(Url: widget.Endpoint,e: {"Username":username.toString(),"Password":password.toString()});
    print(json);
    if (json["message"] == "Login Successfull" ||
        json["message"] == "Signup Successfully") {
        prefs = await SharedPreferences.getInstance();
        prefs!.setBool("isLogin", true);
        prefs!.setString("Username", username);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else if (json["message"] == "Invalid LoginDetails" ||
        json["message"] == "Username taken") {
      //AlertDailog
       showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(json["message"]),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Ok"))
              ],
            );
          });
    } else {
      //MAKR: Server Problem alert
    }
  }
}
