import 'package:flutter/cupertino.dart';
import 'package:fresh_in/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeadText extends StatelessWidget {
  String? text;
   CustomHeadText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!, style: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 30,
          color: Constant.mainColor,
          fontWeight: FontWeight.bold,
        )
    ),);
  }
}
