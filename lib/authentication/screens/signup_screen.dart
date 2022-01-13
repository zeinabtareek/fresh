import 'package:flutter/material.dart';
import 'package:fresh_in/authentication/controller/firebase_controller.dart';
import 'package:fresh_in/authentication/screens/login_screen.dart';
import 'package:get/get.dart';


class SignUppage extends  GetWidget<FirebaseController> {
// class SignUppage extends  GetWidget<AuthController> {

  // final controller = Get.put(AuthController());
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();


   @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
          child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(

                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: "example@example.com",
                        labelText: "Email",
                      ),
                    ),
                    TextField(
                      controller: passController,
                      decoration: const InputDecoration(
                        hintText: "******",
                        labelText: "Password",
                      ),
                    ),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "Display Name",
                        labelText: "User Name",
                      ),
                    ),
                    GestureDetector(child: Text('already have an account ?LOG IN'),
                      onTap: (){
                        Get.to(LogInFinal());
                      },),

              FlatButton(onPressed:(){
                controller.createUser(nameController.text, emailController.text, passController.text);
                // controller.register(emailController.text, nameController.text,passController.text);
              },
                child: Text('Register',style: TextStyle(color: Colors.white),),color: Colors.blueAccent,),

                  ],
          ),
      ),
      
    );
  }
}
