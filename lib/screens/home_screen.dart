import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/categories/screens/add_list_screen.dart';
import 'package:fresh_in/categories/widgets/float_button.dart';
import 'package:fresh_in/constant.dart';
import 'package:fresh_in/database/list_view_builder.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/widgets/clib_pic.dart';
import 'package:fresh_in/widgets/custom_button.dart';
import 'package:fresh_in/widgets/custom_carousel.dart';
import 'package:fresh_in/widgets/custom_h1.dart';
import 'package:fresh_in/widgets/custom_text.dart';
import 'package:fresh_in/drawer/screen/drawer_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cart_screen.dart';
class homePage extends StatefulWidget {
  final title;

  const homePage({Key? key, this.title}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  PageController pageController = PageController();
  String CategoryItemName = '';
  AppBarWedget appBarWedget = AppBarWedget(
    title: '',
    actions: [],
    onPressed: () {},
  );
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appBarWedget.ScaffoldKey,
      drawer: DrawerWedget(),
      appBar: AppBarWedget(
        title: '',
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
                    color: Constant.mainColor,
                    onPressed: () {
                      Get.to(Drawer);
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ),
                Constant.sizedBoxW,
                GestureDetector(
                  onTap: () {
                    Get.to(CartView());
                  },
                  child: Stack(
                    children: const [
                      Icon(
                        Icons.shopping_cart,
                        size: 26.0,
                        color: Constant.mainColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Constant.sizedBoxW,
                      CustomOutLinedButton(
                        text: '      Women      ', onpressed: () {  },
                      ),
                      CustomOutLinedButton(
                        text: '       Men       ', onpressed: () {  },
                      ),
                      CustomOutLinedButton(
                        text: '       Kids       ', onpressed: () {  },
                      ),
                      Constant.sizedBoxW,
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCircleAvatar(),
                        CustomText(text2: 'Exclusive'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCircleAvatar(),
                        CustomText(text2: 'Offers'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCircleAvatar(),
                        CustomText(text2: 'New'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCircleAvatar(),
                        CustomText(text2: 'Flat 30% Off'),
                      ],
                    ),
                  ],
                ),
                Constant.sizedBoxH,
                CustomHeadText(
                  text: 'Top Offers',
                ),
                carousel(),
                CustomHeadText(
                  text: 'Men Products',
                ),
                Constant.sizedBoxH,
                Container(
                  height: 350,
                  child: const Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Constant.mainColor,
                        width: 0.3,
                      ),
                    ),
                    child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqz-ZElrVyZoNo-iM5qQXkJxa2-ftvhhJ3AqagC9FjZK--73DaS5_Rd7IZ6T2dDFS6dvo&usqp=CAU',),
                      // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNo-p1slXVsPd70UC_YmqAixdV73_JgIrZCu99HlkfO929tJ6xToKhU5TosvIy_7GJcsU&usqp=CAU',),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Constant.sizedBoxH,
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: FutureBuilder(
                    future: getPosts(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 300 / 500,
                          ),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 0.3,
                                ),
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .35,
                                width: MediaQuery.of(context).size.width * .44,
                                child: Stack(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Get.to(ListCloudData());
                                        },
                                        child: Image(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          image: NetworkImage(
                                              snapshot.data[index]['image']),
                                          fit: BoxFit.fill,
                                        )),
                                    Stack(
                                      children: [
                                        Container(
                                          padding:const EdgeInsets.only(top: 35,bottom: 35,right: 35,left: 5),
                                          child: Text(
                                            'Product Name',
                                            style: GoogleFonts.lato(
                                              textStyle: const TextStyle(
                                                overflow: TextOverflow.fade,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Constant.mainColor,
                                              ),
                                            ),
                                          ),
                                          color: Colors.grey.withOpacity(0.3),
                                          width: MediaQuery.of(context).size.width,

                                        ),
                                        const Positioned(
                                            child: Icon(Icons.favorite_border ,
                                              size :25,

                                              color: Constant.mainColor,),
                                          top: 30,
                                          right: 5,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      onPressed: () {},
                      color: Constant.mainColor,
                      child: const Text(
                        'عربي',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatActionButtonc(onPressed: () {Get.to(AddListPage());  },),
    );
  }

}

Future getPosts() async {
  var fireStore = FirebaseFirestore.instance;
  QuerySnapshot qn = await fireStore.collection('product').get();
  return qn.docs;
}
