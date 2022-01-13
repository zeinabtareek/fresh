import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_in/authentication/controller/firebase_controller.dart';
import 'package:fresh_in/categories/model/category_mode.dart';
import 'package:fresh_in/categories/services/category_statue_services.dart';
import 'package:get/get.dart';

class CategoryStatueController extends GetxController{
  CategoryStatueServices categoryStatueServices =Get.put(CategoryStatueServices());
  final name = 'value'.obs;
  final selectedValue = 'value'.obs;

  final model=<CatagoryModel>[].obs;

//   List<CatagoryModel> get todos=>_todoList;
// List<CatagoryModel> _todoList =[];

changeCategory(String value ){
  name.value=value;
}



  final language = ['English', 'Espanol'];

   onSelected(String value) {
    selectedValue.value = value;
  }
}




