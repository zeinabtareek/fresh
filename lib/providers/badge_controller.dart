

import 'package:get/get.dart';
import 'package:badges/badges.dart';

class BadgesController extends GetxController{
  final label =0.obs;

  increment(){
    label.value++;
  }
}