import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/drawer/screen/drawer_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';


class usersFireStore extends StatelessWidget{
  CollectionReference users =FirebaseFirestore.instance.collection('users');
  late String  userName ;
  late int userAge ;
   late String userNote ;
  GlobalKey<ScaffoldState> ScaffoldKey =  GlobalKey<ScaffoldState>();
  AppBarWedget appBarWedget = AppBarWedget(
    title: '',
    actions: [],
    onPressed: () {},
  );
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     key: appBarWedget.ScaffoldKey,
     drawer: DrawerWedget(),
     appBar: AppBarWedget(actions: [], title: 'Contact Us',
       onPressed: () {
         appBarWedget.ScaffoldKey.currentState!.openDrawer();

       },),
     body: Container(
       height: MediaQuery.of(context).size.height/2,
     color: Colors.white,
     padding: const EdgeInsets.all(22),
     child: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Container(
               height: 88,
               width: double.infinity,
                 decoration: const BoxDecoration(
                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(150),
                   ),color: Colors.teal,
                 ),
                 child: const Text('Be In Touch', style: TextStyle(color: Colors.white, fontSize: 35 , fontWeight: FontWeight.bold),)),
             TextField(
               onChanged: (value){
                 userNote =value ;
               },
               // controller:noteController ,
               decoration: const InputDecoration(
                 hintText: 'Enter a Note',
               ),
             ),
             TextField(
               onChanged: (value){
                 userName =value ;
               },
               // controller:noteController ,
               decoration: const InputDecoration(
                 hintText: 'Enter a name',
               ),
             ),
             FlatButton(
                child: const Text('submit data',style: TextStyle(
                  color: Colors.white,
                ),),
                color: Colors.black,
                onPressed: () async{
                  await users.add({
                   'name' : userName,
                   'age' : userAge,
                   'note' : userNote,
                   }).then((value) => print('user added'))
                   .catchError((error)=>print('Failed to add Users :$error'));},

             ),
           ],
         ),
       ),
     ),
   );
  }

}