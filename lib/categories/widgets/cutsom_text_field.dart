

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hinttext,
    required this.labeltext, this.keyboardType,
  }) ;

  final TextEditingController controller;
  final hinttext ;
  final labeltext ;
  final keyboardType ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Constant.mainColor,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: Constant.mainColor, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText:hinttext,
        labelText:labeltext ,
        labelStyle: const TextStyle(
          color: Constant.mainColor,
        ),
        fillColor: Constant.mainColor,
        focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: Constant.mainColor, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ) ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(),
        ),
      ),
      keyboardType: keyboardType,
      style: const TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }
}
