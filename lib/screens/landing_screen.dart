import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fresh_in/categories/controller/product_controller.dart';
import 'package:fresh_in/categories/screens/add_list_screen.dart';
import 'package:fresh_in/categories/widgets/float_button.dart';
import 'package:fresh_in/constant.dart';
import 'package:fresh_in/categories/model/product_model.dart';
import 'package:fresh_in/providers/product_providers.dart';
import 'package:fresh_in/screens/home_screen.dart';
import 'package:fresh_in/categories/widgets/category_all_h_cards.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/widgets/clib_pic.dart';
import 'package:fresh_in/widgets/custom_h1.dart';
import 'package:fresh_in/widgets/custom_text.dart';
import 'package:fresh_in/drawer/screen/drawer_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../categories/screens/categories_screen.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBarWedget appBarWedget = AppBarWedget(
      title: '',
      actions: [],
      onPressed: () {},
    );
    FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
    final productController = Get.put(ProductController());

    ScrollController scrollController = ScrollController();
    final radius = MediaQuery.of(context).size.shortestSide * .4;
    final borderWidth = radius / 12;

    return Scaffold(
        key: appBarWedget.ScaffoldKey,
        appBar: AppBarWedget(
          title: 'Shop All Deals',
          onPressed: () {
            appBarWedget.ScaffoldKey.currentState!.openDrawer();
          },
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 26.0,
                    color:Constant.mainColor,
                    onPressed: () {
                      Get.to(Drawer);
                    },
                    icon: const Icon(
                      Icons.search,
                      color:Constant.mainColor,
                    ),
                  ),
                  Constant.sizedBoxH,
                  GestureDetector(
                    onTap: () {
                      // productController.getData();
                    },
                    child: Stack(
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                          size: 26.0,
                          color:Constant.mainColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: DrawerWedget(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: (55 / 50),
                  child: Container(
                    child: Text(''),
                    decoration: BoxDecoration(
                      color:Constant.mainColor,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(144),
                      ),
                      border: Border.all(
                        width: 3,
                        color: Colors.white10,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                Column(children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: InkWell(
                      onTap: (){
                        Get.put(homePage());
                      },
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMIstGZLgL5LYW5_2SGdWSN5BM0V-EZDuzFw&usqp=CAU',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Constant.sizedBoxH,
                  Container(
                    width: 330,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: (){Get.put(homePage());},
                            child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(11.0),
                                )),
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Constant.mainColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(11.0),
                                      ),
                                    ),
                                    height: 120,
                                    width: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: InkWell(
                                        onTap: (){
                                          Get.put(homePage());
                                        },
                                        child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRguU5ic18TA_-gyqaZweUf96iOpWdDNNzenA&usqp=CAU',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ))),
                          ),
                          Card(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(11.0),
                              )),
                              child: Container(
                                  decoration: const BoxDecoration(
                                    color: Constant.mainColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(11.0),
                                    ),
                                  ),
                                  height: 120,
                                  width: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: InkWell(
                                      onTap: (){
                                        Get.put(homePage());
                                      },
                                      child: Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtgAyk01kiM66DWjkzj8k5YwuzJ0BcSDvHkQ&usqp=CAU',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ))),
                        ]),
                  ),
                  Container(
                      width: 330,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: (){Get.put(homePage());},
                            child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(11.0),
                                )),
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Constant.mainColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(11.0),
                                      ),
                                    ),
                                    height: 120,
                                    width: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTy-TeQj1xwFNQ_Oa8qnxEbrgLFeQZGLMPLg&usqp=CAU ',
                                        fit: BoxFit.fill,
                                      ),
                                    ))),
                          ),
                          InkWell(
                            onTap: (){Get.put(homePage());},
                            child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(11.0),
                                )),
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Constant.mainColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(11.0),
                                      ),
                                    ),
                                    height: 120,
                                    width: 150,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3ns8LAeoJcKc6NmSPqpCr3iCu8BlrYxjAFQ&usqp=CAU',
                                          fit: BoxFit.fill,
                                        )))),
                          ),
                        ],
                      )),
                ])
              ],
            ),
            Constant.sizedBoxH,
            CustomHeadText(
              text: "BEST PRODUCTS",
            ),
            Constant.sizedBoxH,
            Container(
              height: 133,
              width: double.infinity,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDg69lEs96Owhj1YFL9iDDbbc9gKJI9246kQ&usqp=CAU',
                fit: BoxFit.fill,
              ),
            ),
            Card(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                    ),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(

                        margin: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // if (list.length <= 6)

                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text2: 'productContr'),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite))
                                ],
                              ),
                            ),
                      Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMIstGZLgL5LYW5_2SGdWSN5BM0V-EZDuzFw&usqp=CAU',
                      fit: BoxFit.fill,

                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 333,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(onTap: (){Get.put(CategoriesPage());},
                        child :CustomCircleAvatar(),),
                      InkWell(onTap: (){Get.put(CategoriesPage());},
                        child :CustomCircleAvatar(),),
                      InkWell(onTap: (){Get.put(CategoriesPage());},
                        child :CustomCircleAvatar(),),
                      InkWell(onTap: (){Get.put(CategoriesPage());},
                        child :CustomCircleAvatar(),),
                      InkWell(onTap: (){Get.put(CategoriesPage());},
                        child :CustomCircleAvatar(),),
                    ],
                  ),
                  CustomHeadText(
                    text: 'Best Selling..',
                  ),
                  Constant.sizedBoxH,
                  Container(
                    height: 133,
                    width: double.infinity,
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDg69lEs96Owhj1YFL9iDDbbc9gKJI9246kQ&usqp=CAU',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Constant.sizedBoxH,
            AspectRatio(
                aspectRatio: (70 / 50),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      // height: 650,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderWidth),
                          color: Colors.grey.shade100,
                          border: Border.all(color: Colors.black12, width: 1)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                      child: HorizontalCards(),
                    ),
                  ],
                )),
            Constant.sizedBoxH,
            CustomHeadText(text: 'Top Products...'),
            GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 5.0,
                shrinkWrap: true,
                children: List.generate(4, (index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 11.0, top: 11.0),
                        child: RatingBarIndicator(
                          rating: 2.75,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Container(
                          child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuceKbWTvhY0PVAANcPUSC-ovekxTIsPpmxg&usqp=CAU'),
                          padding: EdgeInsets.only(top: 30.0),
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(
                              width: 1.0,
                              color: Constant.mainColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },),),
          ],),
        ),),
      floatingActionButton: FloatActionButtonc(onPressed: () {Get.to(AddListPage());  },),

    );
  }
}
