import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fresh_in/authentication/screens/login_screen.dart';
import 'package:fresh_in/authentication/screens/signup_screen.dart';
import 'package:fresh_in/screens/landing_screen.dart';
import '../main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'home_screen.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);


  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
         child: Image.asset('images/splash.jpeg',fit: BoxFit.fill,),


      )

    );
  }
}
