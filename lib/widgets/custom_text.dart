

import 'package:flutter/cupertino.dart';
import 'package:fresh_in/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String text2 ;

   CustomText({
     required this.text2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text( text2.toUpperCase(),style:
    GoogleFonts.lato(textStyle:const TextStyle(
      fontWeight: FontWeight.bold,
    color: Constant.mainColor,
    ),

    ),);
  }
}
