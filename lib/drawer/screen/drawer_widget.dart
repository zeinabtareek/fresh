import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/authentication/controller/firebase_controller.dart';
import 'package:fresh_in/authentication/screens/login_screen.dart';
import 'package:fresh_in/drawer/controller/drawer_selected.dart';
import 'package:fresh_in/screens/mail_us_screen.dart';
import 'package:fresh_in/screens/fire_store_test.dart';
import 'package:fresh_in/screens/home_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../constant.dart';

class DrawerWedget extends GetWidget<FirebaseController> {
  String datafromlogin = " ";
  final DrawerControllerc ctr = Get.put(DrawerControllerc());
  final FirebaseController controller = Get.put(FirebaseController());

  List<String> drawerItem = [
    // 'LogIn/Register ',
    'Home',
    'Mail us',
    'Contact Us',
    'Inbox',
    'Call Us',
    ' عربي',
    'Sign Out',
  ];
  List<IconData> drawerIcons = [
    // Icons.login,
    Icons.home,
    Icons.send,
    Icons.contact_page_sharp,
    Icons.message,
    Icons.call,
    Icons.language,
    Icons.logout,
  ];
  List<void> drawerFunctions=[

    Get.back(),
    Get.put(MailPage()),
    Get.back(),
    Get.back(),
    Get.back(),
    Get.back(),
    Get.back(),

  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: ListView(
        children: [
          DrawerHeader(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/two.jpeg'),
                    ),
                    Text('Welcome \n' + controller.user!.email.toString())
                  ]),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: drawerItem.length,
            itemBuilder: (context, index) {
              return   ListTile(
                  tileColor: ctr.selectedIndex==index?Colors.grey.shade200:Colors.white,
                enabled: true,
                leading: TextButton.icon(
                  onPressed: () {
                    ctr.pressed(index);
                    Get.back();

                  },
                  label: Text(
                    drawerItem[index].toString(),
                    style: const TextStyle(
                      color: Constant.blackColor,
                    ),
                  ),
                  icon: Icon(
                    drawerIcons[index],
                    color: Constant.blackColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
