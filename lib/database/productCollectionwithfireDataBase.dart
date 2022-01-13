// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
//
// import 'list_view_builder.dart';
//
// class ProductFirebaseCollection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  ProductFirebaseCollectionPage();
//
//   }
// }
//
// class ProductFirebaseCollectionPage extends StatefulWidget {
//   @override
//   State<ProductFirebaseCollectionPage> createState() =>
//       _ProductFirebaseCollectionPageState();
// }
//
// class _ProductFirebaseCollectionPageState
//     extends State<ProductFirebaseCollectionPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body:StreamBuilder<QuerySnapshot>( //1
//         stream: FirebaseFirestore.instance.collection('/product').snapshots(), //2
//         builder: (context ,snapshot){  //3
//           if(!snapshot.hasData) //4
//             return Text('Loading Data ..Please wait');
//           return  SafeArea(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('product name: ${snapshot.data!.docs[0]['name']}'),
//                   SizedBox(height: 22,),
//                   Image(image: NetworkImage('${snapshot.data!.docs[0]['image']}')),
//                   SizedBox(height: 22,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('brand: ${snapshot.data!.docs[0]['brand']}'),
//                       SizedBox(width: 22,),
//                       Text(' Price : \ ${snapshot.data!.docs[0]['price']}'),
//                     ],
//                   ),
//                   FlatButton(onPressed: (){
//                     Get.to(listCloudData());
//                   },color: Colors.teal,
//                       child: Text('listbuilderCloudData',style: TextStyle(
//                         color: Colors.white,
//                       ),))
//                 ],
//               ),
//             ),
//           );
//         },
//       ) ,
//       );
//   }
// }
