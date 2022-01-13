

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class BrandServices{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String ref ='brands';
  void creatBrand (String name){
    var id =const Uuid();
    String brandId =id.v1();

    _db.collection(ref).doc(brandId).set({'brand':name});
  }
  Future<List<DocumentSnapshot>> getBrands() async {
    return _db.collection(ref).get().then((snaps){
          return snaps.docs;
        });
  }

}