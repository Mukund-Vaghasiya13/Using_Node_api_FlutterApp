import 'package:flutter/material.dart';
import 'package:todoapp/LoginView/SinupView.dart';

import 'CommonTextField.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: key,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Image.network("https://static.vecteezy.com/system/resources/previews/005/879/539/original/cloud-computing-modern-flat-concept-for-web-banner-design-man-enters-password-and-login-to-access-cloud-storage-for-uploading-and-processing-files-illustration-with-isolated-people-scene-free-vector.jpg"),
              SizedBox(height: 20,),
              MyLoginForm(ButtonTitle: "Login",Endpoint: "https://todo-api-3m2q.onrender.com/Todoapp/login/user",),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SinUPView()));
              }, child: Text("Creat User"))
            ],
          ),
        ),
      ),
    );
  }
}