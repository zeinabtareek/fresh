import 'package:cloud_firestore/cloud_firestore.dart';


class Landing{
  String? image;
  String? imageId;


  Landing(
  {this.image});


  factory Landing.fromJson(DocumentSnapshot snapshot){
    return Landing(
        image: snapshot['image'],

    );}
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['image'] = image;
    return map;


  }

  Landing.fromFirebaseFireStore(Map<String, dynamic> firestore)
      :image = firestore['image'];

}