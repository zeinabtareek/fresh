// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fresh_in/categories/controller/category_statues_controller.dart';
// import 'package:fresh_in/categories/controller/dropdown_controller.dart';
// import 'package:fresh_in/categories/model/category_mode.dart';
// import 'package:fresh_in/categories/screens/add_product_screen.dart';
// import 'package:fresh_in/categories/services/category_statue_services.dart';
// import 'package:fresh_in/widgets/custom_text.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
//
// import '../../constant.dart';
//
// class DropDownWidget extends GetWidget<CategoryStatueController> {
//   CategoryStatueServices categoryStatueServices=Get.put(CategoryStatueServices());
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//
// String categoryname ='';
//   @override
//   Widget build(BuildContext context) {
//     // return GetBuilder<DropdownController>(builder: (controller) {
//     //   return Column(
//     //     mainAxisAlignment: MainAxisAlignment.start,
//     //       crossAxisAlignment: CrossAxisAlignment.stretch,
//     //       children: [
//     //         Text( 'Select a Category: '.toUpperCase(),
//     //         style:GoogleFonts.lato(textStyle:const TextStyle(
//     //         fontWeight: FontWeight.bold,
//     //         color: Constant.mainColor,
//     //           decoration: TextDecoration.underline,
//     //         ),
//     //         ),
//     //     ),
//     //         const SizedBox(height: 10.0),
//     //         Flexible(
//     //
//     //           child: DropdownButton<String> (
//     //               hint: const Text('Category     '),
//     //               value: controller.selectedValue,
//     //               onChanged: (newValue) {
//     //                 controller.onSelected(newValue!);
//     //               },
//     //           elevation: 22,
//     //           items: const [
//     //             DropdownMenuItem(
//     //               child: Text("Fashion"),
//     //               value: 'Fashion',
//     //             ),
//     //             DropdownMenuItem(
//     //               child: Text("Health and Beauty"),
//     //               value: 'Health and Beauty',
//     //             ),
//     //           ]),
//     //         ),
//     //   ]);
//     // });
//     return StreamBuilder<List<CatagoryModel>>(
//         stream: categoryStatueServices.catStatueStream(),
//       builder: (BuildContext, AsyncSnapshot<List<CatagoryModel>> snapshot){
//           final Listx =categoryStatueServices.catStatueStream();
//           if(snapshot.hasData){
//             CatagoryModel  catagoryModel=snapshot.data as CatagoryModel;
//             return Obx(() =>
//
//                 );
//           }
//           return CircularProgressIndicator();
//       },
//     );
// }}