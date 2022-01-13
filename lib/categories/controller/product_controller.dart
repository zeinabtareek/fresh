import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fresh_in/Firebase_apis/firestore_services.dart';
import 'package:fresh_in/categories/model/product_model.dart';
import 'package:fresh_in/categories/services/product_services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ProductController extends GetxController {

  final FirebaseServices firebaseService = FirebaseServices();
  final name = ''.obs;
  final price = ''.obs;
  final amount = ''.obs;
  final discount = ''.obs;
  final imagePicker = ImagePicker();
  final image = ''.obs;
  final longDescription=''.obs;
  final shortDescription=''.obs;
  final model=<ProductModel>[].obs;
  final read=<List<ProductModel>?>[].obs;
  String? _productId;
  var uuid = Uuid();

  changeName(String value) {
    name.value = value;
  }
  changePrice(String value) {
    price.value = value;
  }
  changeDiscount(String value) {
    discount.value = value;
  }
  changeAmount(String value) {
    amount.value = value;
  }
  changeshortDes(String value) {
    shortDescription.value = value;
  }
  changeLingDes(String value) {
    longDescription.value = value;
  }
  sendProduct() async {
    ProductModel pro = await firebaseService.CreatCollection(
        ProductModel(name: name.value,
          price: price.value,
          image: image.value,
          longDescription: longDescription.value,
          shortDescription: shortDescription.value,
          amount:amount.value ,
          discount: discount.value,
        ),
        image.value);
    update();

    return pro;
  }



  /*****************************************************/

  getImage() async { //بتجيب الصور من الجهاز
    try {
      XFile? pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) image.value = pickedFile.path;
    } catch (e) {
      print(e.toString());
    }update();
  }
  /*****************************************************/

  ProductController(){
    getAllProductController();
    // sendProduct();
  }
  List<ProductModel> get productModel=>_productModel;
  List<ProductModel> _productModel =[];

  getAllProductController()async{
    firebaseService.getAllProductServices().then((value) {
      for(int i =0 ; i<value.length ;i++){
        _productModel.add(ProductModel.fromJson(value[i].data() as Map<String, dynamic> ));
      }
      print('the results are + ${_productModel.length}');
      // update();
    }
    );
  }


}
