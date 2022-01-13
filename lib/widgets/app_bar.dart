import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/screens/cart_screen.dart';
import 'package:get/get.dart';

import '../constant.dart';

class AppBarWedget extends StatelessWidget implements PreferredSizeWidget {
  var title = 'uunn';
  final VoidCallback onPressed;
  List<Widget>? actions = [];



  AppBarWedget({
    Key? key,
    required this.title,
    required this.onPressed,
      this.actions ,

  }) : super(key: key);
  GlobalKey<ScaffoldState> ScaffoldKey = new GlobalKey<ScaffoldState>();

  Size get preferredSize => const Size.fromHeight(60);

  // AppBarWedget(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: onPressed,
        color: Colors.black,
        iconSize: 25,
        icon: const Icon(
          Icons.menu,
        ), // add custom icons also
      ),
      actions: actions,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
