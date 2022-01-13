import 'package:flutter/material.dart';
import 'package:fresh_in/authentication/controller/firebase_controller.dart';
import 'package:fresh_in/authentication/model/register_model.dart';
import 'package:fresh_in/authentication/screens/reset_screen.dart';
import 'package:fresh_in/categories/widgets/cutsom_text_field.dart';
import 'package:fresh_in/constant.dart';
import 'package:fresh_in/authentication/screens/signup_screen.dart';
import 'package:fresh_in/widgets/custom_button.dart';
import 'package:fresh_in/widgets/custom_h1.dart';
import 'package:get/get.dart';

class LogInFinal extends GetWidget<FirebaseController> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: (60 / 50),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70),
                        bottomLeft: Radius.circular(70)),
                    color: Constant.mainColor,
                    shape: BoxShape.rectangle,
                  ),
                  height: 35,
                  width: 35,
                ),
              ),
              Constant.sizedBoxH,
              CustomHeadText(text: 'Welcome'),
              Constant.sizedBoxH,
              AspectRatio(
                aspectRatio: (33 / 35),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0 ,right: 8.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: emailController,
                        labeltext: "Enter your Email...",
                        hinttext:  "example@example.com",
                        keyboardType: TextInputType.emailAddress),
                      Constant.sizedBoxH,
                      CustomTextField(
                    hinttext: '******',
                    labeltext:  "Password",
                     keyboardType: TextInputType.visiblePassword,
                    controller: passController,
                 ),
                      Constant.sizedBoxH,
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          child: const Text('Farget the passowrd ?'),
                          onTap: () {
                            Get.to(ResetPassword());
                          },
                        ),
                      ),
                      Constant.sizedBoxH,
                      ElevatedButton.icon(

                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            primary: Constant.mainColor),


                        onPressed: () {
                          controller.login(
                              emailController.text, passController.text);
                        },
                        icon: const Icon(Icons.login),
                        label: const Text('Login'),
                      ),
                      GestureDetector(
                        child: const Text('Create a new account...'),
                        onTap: () {
                          Get.to(SignUppage());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

