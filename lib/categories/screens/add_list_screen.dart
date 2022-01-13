
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/authentication/controller/firebase_controller.dart';
import 'package:fresh_in/categories/controller/category_statues_controller.dart';
import 'package:fresh_in/categories/model/category_mode.dart';
import 'package:fresh_in/categories/screens/add_product_screen.dart';
import 'package:fresh_in/categories/services/category_statue_services.dart';
import 'package:fresh_in/categories/widgets/float_button.dart';
import 'package:fresh_in/drawer/screen/drawer_widget.dart';
import 'package:fresh_in/screens/home_screen.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/widgets/custom_button.dart';
import 'package:fresh_in/widgets/custom_text.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../constant.dart';

class AddListPage extends GetWidget<FirebaseController> {
  CategoryStatueServices _categoryStatueServices=Get.put(CategoryStatueServices());
  AppBarWedget appBarWedget = AppBarWedget(
    title: '',
    actions: [],
    onPressed: () {},
  );
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();

  CategoryStatueController categoryStatueController =Get.put(CategoryStatueController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appBarWedget.ScaffoldKey,
      appBar: AppBarWedget(actions: [], onPressed: () {}, title: '',),
      drawer: DrawerWedget(),

      body: Container(
        color: Colors.grey.shade200,
        child: ListView(
          children: [
            ListTile(
              selectedTileColor: Constant.mainColor,
              enabled: true,
              leading:
              TextButton.icon(
                onPressed: () {
                  Get.off(() => AddNewProduct());
                },
                label: CustomText(text2: 'Add Product',),
                icon: const Icon(
                  Icons.collections_bookmark_sharp,
                  color: Constant.blackColor,
                ),
              ),
            ),
            Constant.sizedBoxH,
            ListTile(
              selectedTileColor: Constant.mainColor,
              enabled: true,
              leading:TextButton.icon(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    actions: <Widget>[
                      TextButton(child: const Text('Add'),
                        onPressed: () {
                        _categoryStatueServices.CreatCategoryStatue(CatagoryModel(catagoryname: categoryController.text), controller.user!.uid);
                        Get.back();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Category cannot be empty'),));
                      },),
                      TextButton(child: const Text('Cancel'), onPressed: () { Get.back(); },),
                    ],
                    content: TextFormField(
                      controller: categoryController,
                      onChanged: (value) {
                        categoryStatueController.changeCategory(value);
                      },
                      decoration: const InputDecoration(
                          hintText: 'add category'
                      ),
                    ),
                  ),
                ),
                label: CustomText(text2: 'Add Category',),
                  icon: const Icon(
                        Icons.category,
                        color: Constant.blackColor,
                      ),
              ),
            ),









            Constant.sizedBoxH,
            ListTile(
              selectedTileColor: Constant.mainColor,
              enabled: true,
              leading:TextButton.icon(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    actions: <Widget>[
                      TextButton(child:  Text('Add'), onPressed: () {
                        

                      },),
                      TextButton(child:  Text('Cancel'), onPressed: () { Get.back(); },),

                    ],
                    content: TextFormField(
                      controller: categoryController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Brand cannot be empty';
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: 'add brand'
                      ),
                    ),
                  ),
                ),
                label: CustomText(text2: 'Add Brand',),
                icon: const Icon(
                  Icons.addchart_rounded,
                  color: Constant.blackColor,
                ),
              ),
            ),
            Constant.sizedBoxH,

          ],
        ),
      ),
      floatingActionButton: FloatActionButtonc(onPressed: () {},),

    );
  }

}

