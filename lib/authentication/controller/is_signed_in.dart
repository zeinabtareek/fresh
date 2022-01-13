import 'package:fresh_in/authentication/screens/login_screen.dart';
import 'package:fresh_in/screens/landing_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'firebase_controller.dart';

class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Get.find<FirebaseController>().user=='' ? LogInFinal() : LandingPage();
    });
  }
}