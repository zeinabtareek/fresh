import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/drawer/screen/drawer_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'home_screen.dart';

class MailPage extends StatelessWidget {
  AppBarWedget appBarWedget = AppBarWedget(
    title: '',
    actions: [],
    onPressed: () {},
  );
  late String title;
  GlobalKey<ScaffoldState> ScaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController mailConroller = TextEditingController();
  final maxLines = 5;

  MailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appBarWedget.ScaffoldKey,
      drawer: DrawerWedget(),
      appBar: AppBarWedget(
        title: 'Mail Us',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: IconButton(
                    iconSize: 26.0,
                    color: Colors.black,
                    onPressed: () {
                      // Get.to(Drawer);
                      Get.off(const homePage());
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        onPressed: () {
          appBarWedget.ScaffoldKey.currentState!.openDrawer();
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height / 14,
                  child: Card(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.dangerous_outlined,
                            color: Colors.blueGrey,
                            size: 33,
                          ),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.only(left: 15),
                              width: 325,
                              child: const Text(
                                'loream sumloream ipsumloream ipsumloream ipsumloream ipsumloream ipsuml ipsumloream ipsum',
                                textDirection: TextDirection.ltr,
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(6,0.0 ,6,6),
                height: maxLines * 24.0,
                color: Colors.white,
                child: TextField(
                  maxLines: maxLines,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(color: Colors.black54,)
                    ),focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.black54,)
                  ) ,

                    hintText: "Enter a message",
                    fillColor: Colors.white38,
                    filled: true,
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.all(9),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    onPressed: () {},
                    height: 44,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                    ),
                    color: Colors.blueGrey,
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
