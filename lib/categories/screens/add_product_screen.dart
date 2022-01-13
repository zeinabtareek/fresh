import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_in/categories/controller/category_statues_controller.dart';
import 'package:fresh_in/categories/widgets/drop_down.dart';
import 'package:fresh_in/drawer/screen/drawer_widget.dart';
import 'package:fresh_in/providers/checkbox_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fresh_in/categories/controller/product_controller.dart';
import 'package:fresh_in/constant.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/widgets/custom_h1.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:fresh_in/categories/services/product_services.dart';
import 'package:get/get.dart';
import 'categories_screen.dart';
import '../services/category_statue_services.dart';
import '../services/brand_services.dart';
import 'dart:convert';

class AddNewProduct extends GetWidget<ProductController> {
  AppBarWedget appBarWedget = AppBarWedget(
    title: '',
    actions: [],
    onPressed: () {},
  );
  final FirebaseServices firebaseService = FirebaseServices();
  final CheckController ctr = Get.put(CheckController());
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  late String selectedValue;
  final CategoryStatueServices categoryStatueServices =
      Get.put(CategoryStatueServices());
  final CategoryStatueController categoryStatueController =
      Get.put(CategoryStatueController());

  @override
  Widget build(BuildContext context) {


    selectedValue=categoryStatueController.name.toString();
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      key: appBarWedget.ScaffoldKey,
      drawer: DrawerWedget(),
      appBar: AppBarWedget(
        onPressed: () {},
        title: '',
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_forward),
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomHeadText(text: 'Add New Product'),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  height: MediaQuery.of(context).size.height / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Product Image',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          controller.getImage();
                        },
                        child: SizedBox(
                          height: 500,
                          width: 200,
                          child: controller.image != ''
                              ? Image.file(File(controller.image.value))
                              : Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/Placeholder.jpeg?alt=media&token=46ff6f3b-c33c-46d5-9f9b-f2a2639f3b5c',
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Constant.sizedBoxH,
                Container(
                  padding: const EdgeInsets.all(11),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Product Name',
                          hintText: 'Shoes',
                          hintStyle: TextStyle(
                            color: Colors.black12,
                          ),
                        ),
                        onChanged: (value) {
                          controller.changeName(value);
                        },
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: '100\$',
                          labelText: 'Price',
                        ),
                        onChanged: (value) {
                          controller.changePrice(value);
                        },
                      ),
                      Constant.sizedBoxH,
                    ],
                  ),
                ),
                Constant.sizedBoxH,
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          TextField(
                            cursorHeight: 30,
                            style: const TextStyle(
                              fontSize: 17.0,
                              height: 5.0,
                            ),
                            decoration: const InputDecoration(
                              labelText:
                                  'Enter the product " short description"',
                              hintText: 'Description',
                              alignLabelWithHint: true,
                            ),
                            onChanged: (value) {
                              controller.changeshortDes(value);
                            },
                          ),
                          TextField(
                            style: const TextStyle(
                              fontSize: 17.0,
                              height: 5.0,
                            ),
                            decoration: const InputDecoration(
                              labelText:
                                  'Enter the product " long description"',
                              hintText: 'Description',
                              alignLabelWithHint: true,
                            ),
                            onChanged: (value) {
                              controller.changeLingDes(value);
                            },
                          ),
                        ],
                      ),
                      Constant.sizedBoxH,
                    ],
                  ),
                ),
                Constant.sizedBoxH,
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  padding: const EdgeInsets.all(11.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Product amount',
                      hintText: '200',
                      hintStyle: TextStyle(
                        color: Colors.black12,
                      ),
                    ),
                    onChanged: (value) {
                      controller.changeAmount(value);
                    },
                  ),
                ),
                Constant.sizedBoxH,


              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: FormField<String>(
              //     builder: (FormFieldState<String> state) {
              //       return InputDecorator(
              //         decoration: InputDecoration(
              //             border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(5.0))),
              //         child: DropdownButtonHideUnderline(
              //           child: DropdownButton<String>(
              //             isExpanded: true,
              //             hint: Text("Select Device"),
              //             value: selectedValue,
              //             isDense: true,
              //             onChanged: (newValue) {
              //              // selectedValue= newValue!;
              //               print(selectedValue);
              //             },
              //             items: categoryStatueController.todos.map((value) {
              //               return DropdownMenuItem<String>(
              //                 value: value.id,
              //                 child: Text(value.catagoryname.toString()),
              //               );
              //             }).toList(),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),



                Obx(() => CheckboxListTile(
                      title: const Text(' Discount ?..Optional'),
                      onChanged: (bool? value) {
                        ctr.checkBool.value = !ctr.checkBool.value;
                        ctr.isChecked.value = !ctr.isChecked.value;
                        print(ctr.checkBool.value);
                        print(ctr.isChecked.value);
                      },
                      value: ctr.checkBool.value,
                    )),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  padding: const EdgeInsets.all(11.0),
                  child: Obx(
                    () => (ctr.isChecked.value == true)
                        ? TextField(
                            decoration: const InputDecoration(
                                labelText: 'Discount',
                                hintText: '200.0\$',
                                hintStyle: TextStyle(
                                  color: Colors.black12,
                                )),
                            onChanged: (value) {
                              controller.changeDiscount(value);
                            },
                          )
                        : Container(
                            height: 0,
                          ),
                  ),
                ),
                FlatButton.icon(
                    minWidth: double.infinity,
                    color: Colors.teal,
                    onPressed: () {
                      Get.to(CategoriesPage());
                      controller.sendProduct(); //************************
                    },
                    icon: Icon(Icons.save),
                    label: Text('save')),
                FlatButton.icon(
                  minWidth: double.infinity,
                  onPressed: () {
                    Get.back();
                  },
                  color: Colors.red,
                  icon: const Icon(Icons.delete),
                  label: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
