// // here is our logic or back end code
// //provider =controller ==viewModel
// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:fresh_in/Firebase_apis/firestore_services.dart';
// import 'package:fresh_in/categories/model/product_model.dart';
// import 'package:uuid/uuid.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:fresh_in/Firebase_apis/Firebase_storge_apis.dart';
// import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//





// class ProductProvider extends GetxController {
//   final FirebaseService firebaseService = FirebaseService();
//   final name = ''.obs;
//   final price = ''.obs;
//   final amount = ''.obs;
//   final discount = ''.obs;
//   final imagePicker = ImagePicker();
//   final image = ''.obs;
//   final longDescription=''.obs;
//   final shortDescription=''.obs;
//   final model=<ProductModel>[].obs;
//   final read=<ProductModel>[].obs;
//   String? _productId;
//   var uuid = Uuid();
//
//   changeName(String value) {
//     name.value = value;
//   }
//
//   changePrice(String value) {
//     price.value = value;
//   }
//   changeDiscount(String value) {
//     discount.value = value;
//   }
//   changeAmount (String value) {
//     amount.value = value;
//   }
//   changeshortDes(String value) {
//     shortDescription.value = value;
//   }
//   changeLingDes(String value) {
//     longDescription.value = value;
//   }
//   sendProduct() async {
//     ProductModel pro = await firebaseService.saveProduct(
//         ProductModel(name: name.value,
//           price: price.value,
//           image: image.value,
//           longDescription: longDescription.value,
//           shortDescription: shortDescription.value,
//           amount:amount.value ,
//           discount: discount.value,
//         ),
//         image.value);
//
//     return pro;
//   }
//
//   getImage() async { //بتجيب الصور من الجهاز
//     try {
//       XFile? pickedFile =
//           await imagePicker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) image.value = pickedFile.path;
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//
//
//
//   @override
//   Future<void> onInit()async {
//     // TODO: implement onInit
//     super.onInit();
//     // model.addAll(await firebaseService.getAllCategory());
//     getData();
//   }
//
//   Stream<List<ProductModel>> streamcategory(){
//     return firebaseService.getStreamCategory();
//   }
//
// getData()async{
//   model.assignAll(await firebaseService.getAllCategory());
// }
//
// }
