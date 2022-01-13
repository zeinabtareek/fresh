

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_in/categories/model/category_mode.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:uuid/uuid.dart';

class CategoryStatueServices{
  final status = false.obs;
  final catagoryname = ''.obs;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<CatagoryModel> CreatCategoryStatue (CatagoryModel catagoryModel,String uid)async{
    try {
      await _db.collection('Categories status').add( catagoryModel.toMap());

  }catch(e){
      print(e);}
      return catagoryModel;}

  Future<void> catagoryDelete(CatagoryModel catagorymodel)async{
    try {await _db.collection('Categories status').doc(catagorymodel.id).delete();
    } catch (e) {
    }
  }


Stream<List<CatagoryModel>> catStatueStream([String? uid]){
return _db.collection('Categories status').snapshots().map((QuerySnapshot querySnapshot) {
  List<CatagoryModel> retVal =[];
  querySnapshot.docs.forEach((element) { 
    retVal.add(CatagoryModel.fromDocumentSnapshot(element));
  });
  return retVal ;
  
} );
 }
}







