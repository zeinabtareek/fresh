// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fresh_in/categories/controller/top_products_controller.dart';
// import 'package:fresh_in/categories/services/top_products_services.dart';
// import 'package:fresh_in/database/list_view_builder.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import '../../constant.dart';
// import '../../widgets/h_additem_icon.dart';
//
// class VerticalCardItem extends GetWidget<TopProductsController> {
//   final  TopProServices topProServices =TopProServices();
//
//    VerticalCardItem({
//     Key? key,
//     required this.increment,
//   }) : super(key: key);
//
//   final int increment;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//         side: const BorderSide(
//           color: Colors.black,
//           width: 0.3,
//         ),
//       ),
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height * .38,
//         width: MediaQuery.of(context).size.width * .44,
//         child: GetBuilder<TopProductsController>(
//                   builder: (controller) =>
//                     Column(
//           children: [
//             InkWell(
//                 onTap: () {
//                   Get.to(ListCloudData());
//                 },
//                 child: Image.network(
//                   'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80',
//                   fit: BoxFit.fill,
//                   height: 160,
//                 )),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
//               child: Column(
//                 children: [
//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "CategoryItemName",
//                       style: TextStyle(
//                         fontSize: 13,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5,),
//
//                   const Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Text(
//                       "60 L.E/KG ",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontSize: 11,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     child: addItemPage(number: controller.topProductModel[1].price.toString(),),
//                     width: double.infinity,
//                   ),
//                   // Container(
//                   //   child: (increment == 0)
//                   //       ? const Text('')
//                   //       : Text("$increment"),
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       ),
//     );
//   }
// }
