import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? image;
  String? name;
  String? username;
  String? phone;
  String? password;
  String? key;

  UserModel(
      {this.image,
        this.name,
        this.phone,
        this.password,
        this.username,
        this.key});

  factory UserModel.fromJson(DocumentSnapshot snapshot) {
    return UserModel(
      phone: snapshot["phone"],
      name: snapshot["name"],
      username: snapshot["username"],
      password: snapshot["password"],
      key: snapshot.id,
    );
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["image"] = image;
    map["name"] = name;
    map["phone"] = phone;
    map["username"] = username;
    map["password"] = password;
    return map;
  }
}
