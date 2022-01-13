// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:fresh_in/Firebase_apis/firestore_services.dart';
// import 'package:fresh_in/database/list_view_builder.dart';
// import 'package:fresh_in/providers/product_providers.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import '../data.dart';
//
// class ProductWidget extends StatelessWidget {
//   List x = allItems;
//   // final ProductProvider _ctrl =Get.put(ProductProvider());
//   FirebaseStorage storage = FirebaseStorage.instance;
//   final FirebaseService firebaseService = FirebaseService();
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     String productCost = "60 L.E/KG ";
//     return FutureBuilder(
//         future: getPosts(),
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image(image: NetworkImage(snapshot.data[1]['image'])),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Obx(()=>Text("_ctrl.name.toString()"),),
//
//                           // Text(
//                           //   '${snapshot.data[1]['name']}',
//                           //   style: TextStyle(
//                           //     fontWeight: FontWeight.bold,
//                           //     fontSize: 19,
//                           //   ),
//                           // ),
//                           SizedBox(
//                             width: 11,
//                           ),
//                           IconButton(
//                             icon: new Icon(
//                               (Icons.favorite_border),
//                             ),
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                       Text(
//                         '\$ ${snapshot.data[2]['price']}',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 33,
//                 ),
//               ],
//             );
//           }
//         });
//   }
// }



