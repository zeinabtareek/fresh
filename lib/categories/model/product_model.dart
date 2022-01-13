import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? productId;
  String? name;
  String? image;
  String? price;
  String? discount;
  String? amount;
  String? shortDescription;
  String? longDescription;

  ProductModel({this.productId,
    this.name,
    this.price,
    this.image,
    this.longDescription,
    this.shortDescription,
    this.amount,
    this.discount});

  ProductModel.fromJson(Map<dynamic, dynamic> map){
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    discount = map['discount'];
    amount = map['amount'];
    shortDescription = map['shortDescription'];
    longDescription = map['longDescription'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'discount': discount,
      'amount': amount,
      'shortDescription': shortDescription,
      'longDescription': longDescription,
    };
  }

  // factory products.fromJson(DocumentSnapshot doc) {
  //   return products(
  //     name: doc.data().toString().contains('name') ? doc.get('name') : '',
  //     image: doc.data().toString().contains('image') ? doc.get('image') : '',
  //     price: doc.data().toString().contains('price') ? doc.get('price') : '',
  //     discount: doc.data().toString().contains('discount') ? doc.get('discount') : '',
  //     amount: doc.data().toString().contains('amount') ? doc.get('amount') : '',
  //     shortDescription: doc.data().toString().contains('shortDescription') ? doc.get('shortDescription') : '',
  //     longDescription: doc.data().toString().contains('longDescription') ? doc.get('longDescription') : '',
  //
  //     //   productId=snapshot.id;
  //   );
  // }
//
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    map['image'] = image;
    map['shortDescription'] = shortDescription;
    map['longDescription'] = longDescription;
    map['discount'] = discount;
    map['amount'] = amount;
    return map;
  }

//
  ProductModel.fromFirebaseFireStore(Map<dynamic, dynamic> firestore)
      : productId = firestore['productId'],
        name = firestore['name'],
        price = firestore['price'],
        shortDescription = firestore['shortDescription'],
        longDescription = firestore['longDescription'],
        discount = firestore['discount'],
        amount = firestore['amount'];
}

