import 'package:fresh_in/authentication/controller/firebase_controller.dart';
import 'package:fresh_in/categories/controller/category_statues_controller.dart';
import 'package:fresh_in/drawer/controller/drawer_selected.dart';
import 'package:fresh_in/categories/controller/product_controller.dart';
import 'package:fresh_in/categories/controller/top_products_controller.dart';
import 'package:fresh_in/providers/checkbox_provider.dart';
import 'package:fresh_in/providers/home_View_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies (){
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CheckController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => TopProductsController());
    Get.lazyPut(() => FirebaseController());
    Get.lazyPut(() => DrawerControllerc());
    // Get.lazyPut(() => DropdownController());
    Get.lazyPut(() => CategoryStatueController());

  }
}