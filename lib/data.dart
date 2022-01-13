import 'package:flutter/material.dart';
import 'package:fresh_in/constant.dart';
import 'package:fresh_in/model/item.dart';
import 'package:fresh_in/categories/screens/categories_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

List<List_item> allItems = [
  List_item(
      itemImage:
          'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/6.jpeg?alt=media&token=c8d8c6a4-d9eb-4670-8f30-0cd0d8d5ca1a',
      itemName: 'Poultry',
      onPressed: () {
        Get.to(CategoriesPage());
      }),
  List_item(
      itemImage:
          'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/6.jpeg?alt=media&token=c8d8c6a4-d9eb-4670-8f30-0cd0d8d5ca1a',
      itemName: 'Herbs',
      onPressed: () {}),
  List_item(
      itemImage:
          'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/6.jpeg?alt=media&token=c8d8c6a4-d9eb-4670-8f30-0cd0d8d5ca1a',
      itemName: 'Ready Vegetables',
      onPressed: () {}),
  List_item(
      itemImage:
          'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/6.jpeg?alt=media&token=c8d8c6a4-d9eb-4670-8f30-0cd0d8d5ca1a',
      itemName: 'Natural Oils',
      onPressed: () {}),
  List_item(
      itemImage:
          'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/6.jpeg?alt=media&token=c8d8c6a4-d9eb-4670-8f30-0cd0d8d5ca1a',
      itemName: 'Meat',
      onPressed: () {}),
  List_item(
      itemImage:
          'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/6.jpeg?alt=media&token=c8d8c6a4-d9eb-4670-8f30-0cd0d8d5ca1a',
      itemName: 'Etara',
      onPressed: () {}),
  List_item(
      itemImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0UeUWDBSRAg77snLd2UJECWxR0rRMpMXXvw&usqp=CAU',
      itemName: 'Vegetables',
      onPressed: () {}),
  List_item(
      itemImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0UeUWDBSRAg77snLd2UJECWxR0rRMpMXXvw&usqp=CAU',
      itemName: 'Fruits',
      onPressed: () {}),
  List_item(
      itemImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0UeUWDBSRAg77snLd2UJECWxR0rRMpMXXvw&usqp=CAU',
      itemName: 'Offers',
      onPressed: () {}),
];

final List<String> imagesList = [
  'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/1.jpeg?alt=media&token=e6ebc638-5dca-48c7-8134-42ea4d3f21c8',
  'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/2.jpeg?alt=media&token=c18d3ce0-ecae-45bc-aaaa-7f565bae1d55',
  'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/3.jpeg?alt=media&token=d072c824-eda3-4503-bec0-5144206cdc66',
  'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/5.jpeg?alt=media&token=ad4dc2a2-c7c4-4c32-8fd8-97ce1cbab20a',
  'https://firebasestorage.googleapis.com/v0/b/freshin-d12dd.appspot.com/o/6.jpeg?alt=media&token=c8d8c6a4-d9eb-4670-8f30-0cd0d8d5ca1a',
];
