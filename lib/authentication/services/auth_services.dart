// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:fresh_in/authentication/controller/current_user_controlller.dart';
// import 'package:fresh_in/authentication/model/register_model.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_navigation/src/snackbar/snackbar.dart';
//
// class AuthServices {
//   final _auth = FirebaseAuth.instance;
//   final _store = FirebaseFirestore.instance;
//   final storage = const FlutterSecureStorage();
//
//   updateStorage(UserModel userModel) async {
//     await storage.write(key: 'users', value: userModel.key);
//   }
//
//
// Future<UserModel>register(UserModel userModel)async{
//     try{
//     await  _auth.createUserWithEmailAndPassword(email: userModel.username!, password: userModel.password!);
//     }catch(e){print(e);}
//     UserModel createdUser=await addNewUser(userModel);
//     updateStorage(createdUser);
//     return createdUser;
// }
//   Future<UserModel> login(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//       Get.snackbar("Error log in", e.toString(),
//           snackPosition: SnackPosition.BOTTOM);
//       print(e.toString());
//     }
//     UserModel createdUser =await getUserByEmail(email, password);
//     updateStorage(createdUser);
//     return createdUser;
//   }
//
//
//
//   Future<UserModel> addNewUser(UserModel userModel) async {
//     final data=await _store.collection('users').add(userModel.toJson());
//     userModel.key=data.id;
//     return userModel;
// }
//
//   Future<UserModel> getUserByEmail(String email, String password) async {
//     final data = await _store.collection('users').where(
//         'password', isEqualTo: password)
//         .where('username', isEqualTo: email)
//         .get();
//     if(data.docs.isNotEmpty){
//       return UserModel.fromJson(data.docs.first);
//     }throw 'exception';
//   }
//
//   //
//   Future<UserModel?> getCurrentUser() async {
//     final userKey = await storage.read(key: 'users', );
//     if (userKey == null) {
//       return null;
//     }
//     return UserModel.fromJson(
//         await _store.collection('users').doc(userKey).get());
//   }
//
//   signOut() async {
//     await _auth.signOut();
//     storage.delete(key: 'users');
//   }
//
//
// }