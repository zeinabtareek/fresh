import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/constant.dart';
import 'package:fresh_in/database/productCollectionwithfireDataBase.dart';
import 'package:fresh_in/providers/product_providers.dart';
import 'package:fresh_in/screens/Product_widget.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/drawer/screen/drawer_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProductPage extends StatelessWidget {
  AppBarWedget appBarWedget = AppBarWedget(
    title: '',
    actions: [],
    onPressed: () {},
  );
  String amountCost = "60 L.E/KG ";
  late String title;
  GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController mailConroller = TextEditingController();
  final maxLines = 5;
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appBarWedget.ScaffoldKey,
      drawer: DrawerWedget(),
      appBar: AppBarWedget(
        title: '',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: IconButton(
                    iconSize: 26.0,
                    color: Colors.black,
                    onPressed: () {
                      Get.to(Drawer);
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ),
                Constant.sizedBoxW,
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
        onPressed: () {
          appBarWedget.ScaffoldKey.currentState!.openDrawer();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ProductWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 33,
                    child: Container(
                      width: 130,
                      color: Colors.grey.shade200,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          Constant.sizedBoxW,
                          Text(
                            '1',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Constant.sizedBoxW,
                          Padding(
                            padding: EdgeInsets.only(bottom: 11.0),
                            child: Icon(
                              Icons.minimize,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.teal)))),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(11.0),
                        child: Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Constant.sizedBoxH,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  amountCost,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
