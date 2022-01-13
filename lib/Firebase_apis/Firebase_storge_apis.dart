import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' ;
import 'package:flutter/material.dart';
import 'package:fresh_in/categories/model/product_model.dart';
import 'package:path/path.dart';

class FirebaseApi{
  static UploadTask?  upLoadFile(String destination ,File file ){
    try{
      final ref =FirebaseStorage.instance.ref(destination);
        return ref.putFile(file);
    }on FirebaseException catch(e){
      return null;
    }
  }
}

