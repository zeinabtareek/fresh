import 'dart:core';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:fresh_in/Firebase_apis/firestore_services.dart';
import 'package:fresh_in/categories/controller/product_controller.dart';
import 'package:fresh_in/constant.dart';
import 'package:fresh_in/widgets/custom_button.dart';
import 'package:fresh_in/widgets/custom_h1.dart';
import 'package:fresh_in/widgets/custom_text.dart';
import 'package:fresh_in/categories/model/product_model.dart';
import 'package:fresh_in/providers/product_providers.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/drawer/screen/drawer_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ListCloudData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: listCloudDatapage(),
    );
  }
}

class listCloudDatapage extends StatefulWidget {
  @override
  _listCloudDatapageState createState() => _listCloudDatapageState();
}

class _listCloudDatapageState extends State<listCloudDatapage> {
  AppBarWedget appBarWedget = AppBarWedget(
    title: '',
    onPressed: () {},
    actions: [],
  );
  final _productProvider = Get.put(ProductController());
  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appBarWedget.ScaffoldKey,
      appBar: AppBarWedget(
        title: ' ',
        onPressed: () {
          appBarWedget.ScaffoldKey.currentState!.openDrawer();
        },
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: IconButton(
                    iconSize: 26.0,
                    color: Colors.black,
                    onPressed: () {
                      print('ddd');
                      // Get.to(Drawer);
                    },
                    icon: const Icon(
                      Icons.search,

                    ),
                  ),
                ),
                Constant.sizedBoxW,
                Stack(
                  children: const [
                    Icon(
                      Icons.shopping_cart,
                      size: 26.0,
                      color: Constant.mainColor,
                    ),
                  ],
                ),
                Constant.sizedBoxW,
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 26.0,
                    color: Constant.mainColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: DrawerWedget(),
      body: SafeArea(
        child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 300 / 500,
                    ),
                    itemCount: 99,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .35,
                          width: MediaQuery.of(context).size.width * .44,
                          child :Stack(
                            children: [
                              // Image(
                              //   height: MediaQuery.of(context)
                              //       .size
                              //       .height,
                              //   image: NetworkImage(list[index].image.toString()),
                              //   fit: BoxFit.fill,
                              // ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                color: Colors.grey.withOpacity(0.3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text( "list[index].name.toString()",style: const TextStyle(
                                      color: Constant.mainColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ), ),
                                  Constant.sizedBoxW,
                                  const Icon(Icons.favorite,

                                  ),
                                  const Icon(Icons.shopping_cart),
                                  ],
                                ),
                              ),
                           ],
                         ),
                        ),
                      );
                    }
    )
      )
    );
  }

}

Future getPosts() async {
  var fireStore = FirebaseFirestore.instance;
  QuerySnapshot qn = await fireStore.collection('product').get();
  return qn.docs;
}
