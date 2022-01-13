import 'package:cloud_firestore/cloud_firestore.dart';

class TopProductModel {
  String? productId;
  String? name;
  String? image;
  String? price;
  String? addNum;

  TopProductModel({this.productId,
    this.name,
    this.price,
    this.image,
    this.addNum,
    });

  TopProductModel.fromJson(Map<dynamic, dynamic> map){
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    addNum = map['addNum'];
    price = map['price'];
    }

  toJson() {
    return {
      'name': name,
      'image': image,
      'addNum': addNum,
      'price': price,

    };
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    map['image'] = image;
    map['addNum'] = addNum;
    return map;
  }
  TopProductModel.fromFirebaseFireStore(Map<dynamic, dynamic> firestore)
      : productId = firestore['productId'],
        name = firestore['name'],
        price = firestore['price'],
        addNum = firestore['addNum'];

}

