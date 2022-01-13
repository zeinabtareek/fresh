import 'package:flutter/material.dart';
import 'package:fresh_in/categories/screens/add_list_screen.dart';
import 'package:fresh_in/categories/screens/add_product_screen.dart';
import 'package:fresh_in/providers/badge_controller.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/drawer/screen/drawer_widget.dart';
import 'package:fresh_in/categories/widgets/float_button.dart';
import 'package:fresh_in/categories/widgets/category_all_h_cards.dart';
import 'package:fresh_in/categories/widgets/category_all_v_cards.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import '../../constant.dart';

import 'package:flutter/cupertino.dart';
class CategoriesPage extends StatelessWidget {
  AppBarWedget appBarWedget = AppBarWedget(
    title: '',
    onPressed: () {},
    actions: [],
  );

  @override
  Widget build(BuildContext context) {
    final _controller =Get.put(BadgesController());
    return Scaffold(
        key: appBarWedget.ScaffoldKey,
        appBar: AppBarWedget(
          title: 'All Categories',
          onPressed: () {
            appBarWedget.ScaffoldKey.currentState!.openDrawer();
          },
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: IconButton(
                      iconSize: 26.0,
                      color: Colors.black,
                      onPressed: () {
                        Get.to(Drawer);
                      },
                      icon: InkWell(
                        onTap: (){
                        },
                        child: const Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Badge(
                    badgeContent: Obx(()=>Text(_controller.label.string)),
                    child: InkWell(onTap: (){
                      _controller.increment();
                    },
                        child: const Icon(Icons.shopping_cart,color: Colors.black,)),
                  ),
                  Constant.sizedBoxW,
                  GestureDetector(
                    onTap: () {

                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 26.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: DrawerWedget(),
        body:
        Flex(direction: Axis.horizontal, children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(aspectRatio: (92 / 50), child: HorizontalCards()),

                  AspectRatio(aspectRatio: (38 / 50), child: VerticalCards()),
                ],
              ),
            ),
          ),
        ]),

      floatingActionButton: FloatActionButtonc(onPressed: () {
        Get.put(AddListPage());
      },));


  }

}

