
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Modle/Modle.dart';

class DecoratedField{
 
  // ignore: non_constant_identifier_names
  static InputDecoration TextDesign({String? title,String? Lable,TExtFieldType? e,Widget? icon}){
    return  InputDecoration(
      hintText: title!,
      labelText: Lable!,
      prefixIcon: e == TExtFieldType.secure ? IconButton(onPressed: (){
      }, icon:Icon(Icons.password)): icon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(width: 1.5,color: Colors.black87,) 
      ),
      enabledBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(width: 1.5,color: Colors.black87,) 
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide:const BorderSide(width: 1.5,color: Colors.greenAccent,) 
      ),
    );
  }
}

class APiParshing{

  Future<dynamic> PostRequest({String? Url,Map<String,String>? e}) async{
    const Map<String, String> header = {
      'Content-type': 'application/json',
    };
    var url = Uri.parse(Url ?? "");
    var response = await http.post(url,
        headers: header,
        body: jsonEncode(e));
    var json = jsonDecode(response.body);
    return json;
  }

  Future<dynamic> Getrequest({String? Url}) async{
    const Map<String, String> header = {
      'Content-type': 'application/json',
    };
    var url = Uri.parse(Url ?? "");
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return json;
  }



}