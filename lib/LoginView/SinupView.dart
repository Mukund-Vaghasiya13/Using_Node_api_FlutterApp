import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CommonTextField.dart';

class SinUPView extends StatefulWidget {
  const SinUPView({super.key});

  @override
  State<SinUPView> createState() => _SinUPViewState();
}

class _SinUPViewState extends State<SinUPView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.network("https://static.vecteezy.com/system/resources/previews/005/879/539/original/cloud-computing-modern-flat-concept-for-web-banner-design-man-enters-password-and-login-to-access-cloud-storage-for-uploading-and-processing-files-illustration-with-isolated-people-scene-free-vector.jpg"),
              SizedBox(height: 20,),
              MyLoginForm(ButtonTitle: "Sinup",Endpoint: "https://todo-api-3m2q.onrender.com/Todoapp/post/user",),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Already have account"))
            ],
          ),
        ),
      ),
    );
  }
}