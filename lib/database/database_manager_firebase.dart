import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealTimedb extends StatefulWidget {
  @override
  _RealTimedbState createState() => _RealTimedbState();
}

class _RealTimedbState extends State<RealTimedb> {
 late DatabaseReference  _dbref;
 String databasejson ='';
  @override
  void initState() {
    super.initState();
    _dbref =FirebaseDatabase.instance.reference();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Text('profile'+ databasejson),
                  // Text('job profile'+ databasejson),
                  // Text('price '+ databasejson),
                  // Text('categories'+ databasejson),
                ],
              ),
              TextButton(onPressed: (){
                _creatDB();
                print(_creatDB().toString());
              }, child: Text('Creat DB')),

              TextButton(onPressed: (){
                _ReadoneChild();

              }, child: Text('_ReadoneChild DB')),

              TextButton(onPressed: (){
                _ReadOnce();

              }, child: Text('_ReadOnce')),

              TextButton(onPressed: (){},
                  child: Text('delete DB')),
            ],
          ),
        ),
      ),
    ));
  }
  _creatDB(){
    _dbref.child('profile').set('zeinab Profile');
    _dbref.child('job profile').set({
      'website1':'www.google.com',
      'website2':'www.facebook.com',
      'website3':'www.twitter.com',
    });
    _dbref.child('categories').set({
      'subCategory4':'Fashion',
      'subCategory2':'Health& Beauty',
      'subCategory3':'electronics ',
      'subCategory':'Mobiles',
    }); _dbref.child('brands').set({
      'brand1':'Fashion',
      'brand2':'Health& Beauty',
      'brand4':'electronics ',
      'brand3':'Mobiles',
    });
    
  } //done
  _ReadoneChild(){
   _dbref.child("profile").onValue.listen((event) {
     final String? description =event.snapshot.value.toString();
     print(description);
     setState(() {
       databasejson =description!;
     });
   });
} //done
_ReadOnce(){}
}
