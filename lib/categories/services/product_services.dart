import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/categories/model/product_model.dart';

class FirebaseServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final CollectionReference _collectionReference =FirebaseFirestore.instance.collection('New Products');

  Future<ProductModel> CreatCollection(ProductModel newProduct, String image) async {
    if (image != ' ' && image.isNotEmpty) {
      newProduct.image = await uploadNewImage(image, '123456789');
    }
    final ref = await _db.collection('New Products').add(newProduct.toMap());
    return newProduct;
  }





  Future<String> uploadNewImage(String image, String id) async {
    final ref = FirebaseStorage.instance.ref('/Top Products').child('products $id');
    final uploadTask = ref.putFile(File(image));
    final imageUrl = (await (await uploadTask).ref.getDownloadURL()).toString();
    return imageUrl;
  }


  /*****************************************************/



Future<List<QueryDocumentSnapshot>> getAllProductServices()async{
  var value =await _collectionReference.get();
  return value.docs;
}

}