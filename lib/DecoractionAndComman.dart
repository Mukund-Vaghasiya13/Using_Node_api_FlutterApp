
import 'package:flutter/material.dart';

import 'Modle.dart';


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

