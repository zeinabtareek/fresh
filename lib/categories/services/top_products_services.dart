


import 'package:cloud_firestore/cloud_firestore.dart';

class TopProServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final CollectionReference _collectionReference =FirebaseFirestore.instance.collection('Top Products');

Future<List<QueryDocumentSnapshot>> getAllTopServices()async{
  var value =await _collectionReference.get();
  return value.docs;
}
}