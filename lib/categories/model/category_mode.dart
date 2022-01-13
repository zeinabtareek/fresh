import 'package:cloud_firestore/cloud_firestore.dart';

class CatagoryModel {

  String ?id;
  String ?catagoryname;
  bool ?status;
  Timestamp ?dataCreated;
  String? user;

  CatagoryModel({this.id, this.catagoryname, this.user, this.status,this.dataCreated });



  CatagoryModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    status = documentSnapshot['status'];
    id = documentSnapshot.id;
    catagoryname = documentSnapshot['catagoryname'];
    dataCreated=documentSnapshot['dataCreated'];
  }
    Map<String, dynamic> toMap() {
      var map = <String, dynamic>{};
      map['catagoryname'] = catagoryname;
      map['dataCreated'] = dataCreated;
      map['status'] = status;
      return map;

  }
}