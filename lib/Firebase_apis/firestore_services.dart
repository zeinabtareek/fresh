import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fresh_in/model/landing_page/landing_cards.dart';
import 'package:fresh_in/categories/model/product_model.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<String> uploadImage( String  imagePath, String code) async {
    final ref = FirebaseStorage.instance.ref().child("users_images/$code");
    final uploadTask = ref.putFile(File(imagePath));
    final imageUrl = (await (await uploadTask).ref.getDownloadURL()).toString();
    return imageUrl;
  }

  Future<ProductModel> saveProduct(ProductModel product, String image) async {
    if (image != '' && image.isNotEmpty) {
      product.image = await uploadImage(image,'123456789');
    }
    final ref = await _db.collection('Categories').add(product.toMap());
    product.productId = ref.id;
    return product;
  }

  // Future<List<ProductModel>?> getAllCategory() async {
  //   final data = await _db.collection("Categories").get();
  //   print("ggggg${data.size}");
  //   return data.docs.map((e) => ProductModel.fromJson(e)).toList();
  // }

//   Stream<List<ProductModel>> getStreamCategory(){
//     return _db.collection('Categories').snapshots().transform(StreamTransformer.fromHandlers(handleData: (data,sink){
//       sink.add(data.docs.map((e) => ProductModel.fromJson(e)).toList());
//     }));
// }




Stream<List<Landing>> getStreamLanding(){
    return _db.collection('landingPage').snapshots().transform(StreamTransformer.fromHandlers(handleData: (data,sink){
      sink.add(data.docs.map((e) => Landing.fromJson(e)).toList());
    }));
}


  Future<List<Landing>> getAllLanding() async {
    final data = await _db.collection("landingPage").get();
    return data.docs.map((e) => Landing.fromJson(e)).toList();
  }

}
