// import 'dart:io';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:path/path.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:fresh_in/Consts/app_sizes.dart';
// import 'package:fresh_in/Firebase_apis/Firebase_storge_apis.dart';
// import 'package:fresh_in/database/list_view_builder.dart';
// import 'package:fresh_in/widgets/app_bar.dart';
// import 'package:fresh_in/drawer/screen/drawer_widget.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:file_picker/file_picker.dart';
//
// class AddProduct extends StatefulWidget {
//   @override
//   _AddProductState createState() => _AddProductState();
// }
//
// class _AddProductState extends State<AddProduct> {
//   File? file;
//
//   @override
//   Widget build(BuildContext context) {
//     AppBarWedget appBarWedget = AppBarWedget(
//       title: '',
//       onPressed: () {},
//       actions: [],
//     );
//     FirebaseStorage storage = FirebaseStorage.instance;
//     /**/
//     final fileName = file != null ?
//     basename(file!.path) :
//     'No File Selected';
//
//     Future selectFile() async {
//       final result = await FilePicker.platform.pickFiles(allowMultiple: false);
//       if (result == null) return;
//       final path = result.files.single.path!; //this is bec we choose to select only one file
//       setState(( ) => file = File(path));
//     }
//
//     Future upLoadFile() async {
//       if (file == null) {
//         return ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('No file uploalded')));
//       } else {
//         final fileName = basename(file!.path);
//         final destination = 'FashionProducts/$fileName';
//         FirebaseApi.upLoadFile(destination, file!);
//         return ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('item uploaded')));
//       }
//     }
//
//     Future downloadFile()async{
//     }
//
// /**/
//     return  Scaffold(
//         drawer: DrawerWedget(),
//         appBar: AppBarWedget(
//           onPressed: () {},
//           actions: [
//             Padding(
//               padding: EdgeInsets.only(right: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {},
//                     child: IconButton(
//                       iconSize: 26.0,
//                       color: Colors.black,
//                       onPressed: () {
//                         Get.to(Drawer);
//                       },
//                       icon: const Icon(
//                         Icons.search,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 14,
//                   ),
//                   Stack(
//                     children: [
//                       Icon(
//                         Icons.shopping_cart,
//                         size: 26.0,
//                         color: Colors.black,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 22,
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Icon(
//                       Icons.arrow_forward,
//                       size: 26.0,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//           title: '',
//         ),
//         key: appBarWedget.ScaffoldKey,
//         body: SafeArea(
//             child: Container(
//               padding: EdgeInsets.all(11),
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       '  Add new Product',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height:
//                     MediaQuery.of(context).size.height / 2,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.white12),
//                     ),
//                     child: Row(
//                       mainAxisAlignment:
//                       MainAxisAlignment.spaceBetween,
//                       children: [
//                         Card(
//                           color: Colors.teal,
//                           child: Container(
//                             child: InkWell(
//                               onTap: () {
//                                 selectFile();
//                               },
//                               child: Image(
//                                   height: 200,
//                                   image: NetworkImage('https://firbasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/Placeholder.jpeg?alt=media&token=46ff6f3b-c33c-46d5-9f9b-f2a2639f3b5c')),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 11,
//                         ),
//                         Flexible(
//                           child: Container(
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.start,
//                                 children: [
//                                   FlatButton.icon(
//                                     onPressed: () async {},
//                                     icon: Icon(Icons
//                                         .drive_folder_upload),
//                                     label: Text('Select pic'),
//                                     color: Colors.teal,
//                                   ),
//                                   SizedBox(
//                                     height: 11,
//                                   ),
//                                   Text(
//                                     '$fileName',
//                                     maxLines: 1,
//                                     style: const TextStyle(
//                                       overflow:
//                                       TextOverflow.ellipsis,
//                                       fontSize: 11,
//                                       fontWeight:
//                                       FontWeight.bold,
//                                     ),
//                                   ),
//                                   FlatButton.icon(
//                                     onPressed: () async {
//                                       upLoadFile();
//                                     },
//                                     icon: Icon(Icons
//                                         .drive_folder_upload),
//                                     label: Text('UpLoad'),
//                                     color: Colors.teal,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//             ))
//
//     );
//   }
// }
