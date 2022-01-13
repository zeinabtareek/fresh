import 'package:flutter/material.dart';
import 'package:fresh_in/authentication/controller/firebase_controller.dart';
import 'package:fresh_in/authentication/screens/signup_screen.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class ResetPassword extends GetWidget<FirebaseController> {
  // final controller = Get.put(AuthController());
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "example@example.com",
                  labelText: "Email",
                ),
              ),
              Constant.sizedBoxH,
              ElevatedButton.icon(
                onPressed: () {
                  controller.reset(emailController.text);
                },
                icon: const Icon(Icons.login),
                label: const Text('send email'),
              ),
              Constant.sizedBoxH,
              GestureDetector(
                child: Text('Create a new account'),
                onTap: (){
                  Get.to(SignUppage());
                },
              ),
            ],
          )
      ),
    );
  }
}