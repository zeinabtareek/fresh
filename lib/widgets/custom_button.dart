


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text.dart';

class CustomOutLinedButton extends StatelessWidget {
  String? text;
  VoidCallback onpressed;
   CustomOutLinedButton({
   required this.text,
   required this.onpressed(),

    Key? key, Icon ?icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(

      child: CustomText(text2: '$text') ,
      borderSide: BorderSide(color:Colors.grey.shade200),
      onPressed: () {

      },
    );
  }
}
