import 'package:flutter/material.dart';
import 'package:fresh_in/categories/screens/categories_screen.dart';
import 'package:fresh_in/screens/Product_widget.dart';
import 'package:fresh_in/screens/home_screen.dart';
import 'package:fresh_in/screens/landing_screen.dart';
import 'package:fresh_in/screens/product_screen.dart';
import 'package:fresh_in/widgets/Card_widget.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'authentication/controller/is_signed_in.dart';
import 'categories/screens/add_list_screen.dart';
import 'categories/screens/add_product_screen.dart';
import 'categories/widgets/category_all_v_cards.dart';
import 'categories/widgets/drop_down.dart';
import 'helper/binding.dart';
import 'categories/widgets/category_all_h_cards.dart';
 Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: AddListPage(),
      home: IsSignedIn(),
      // home: VerticalCards(),
      // home: AddNewProduct(),
    );
  }
}
