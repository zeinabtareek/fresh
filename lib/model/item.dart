import 'package:flutter/cupertino.dart';

class List_item {
 late String itemName;
 late String itemImage;
 VoidCallback onPressed ;

 List_item({required this.itemName ,required this.itemImage , required this.onPressed});
}