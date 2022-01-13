


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/screens/home_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CardWidget extends StatelessWidget{
  final TextEditingController TextConroller ;
  CardWidget({required this.verifyOnPressed, required this.TextConroller});
  String datafromlogin ='';
  final VoidCallback verifyOnPressed ;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Align(
       alignment: Alignment.topRight,
       child: Container(
         padding: EdgeInsets.all(11),
         height: MediaQuery.of(context).size.height/3,
         decoration: BoxDecoration(
           // borderRadius: BorderRadius.circular(22.0)
         ),
         child: Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15.0),
           ),
           child: Padding(
             padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(height: 17,),
                 const Align(
                     alignment: Alignment.topLeft,
                     child: Text('Login /Register with Phone number',style: TextStyle(color: Colors.black54 ,fontWeight: FontWeight.bold),)),
                 SizedBox(height: 17,),
                 Container(
                   height: 55,
                   child: TextField(
                     cursorColor: Colors.black54,
                     showCursor: true,
                     controller: TextConroller,
                     cursorRadius: Radius.circular(12.0),
                     decoration:  InputDecoration(
                       filled: true,
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(4)),
                           borderSide: BorderSide(width: 1,color: Colors.black54),
                         ),
                         hoverColor: Colors.black,
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10.0),
                             borderSide: new BorderSide(color: Colors.black),

                         ),
                         hintText: 'Enter a Mobile Number',hintStyle: TextStyle(color: Colors.grey, fontSize: 15)
                     ),
                   ),
                 ),
                 SizedBox(height: 17,),
                 Align(
                   alignment: Alignment.bottomLeft,
                   child: Container(

                     width: MediaQuery.of(context).size.width,
                     child: FlatButton(
                       onPressed:verifyOnPressed,
                       height: 44,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(7)
                       ),
                       color: Colors.blueGrey,
                       child: Text(
                         'Verify',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 22,
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),

         ),
       ),
     ),
   );
  }

}