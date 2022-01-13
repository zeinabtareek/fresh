import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/drawer/screen/drawer_widget.dart';
import 'package:get/get.dart';

import '../constant.dart';
class CartView extends StatelessWidget {
  List<String> names = <String>[
    'name',
    'name',
    'name',
    'name',
    'name',
  ];
  List<String> images = <String>[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0UeUWDBSRAg77snLd2UJECWxR0rRMpMXXvw&usqp=CAU"
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0UeUWDBSRAg77snLd2UJECWxR0rRMpMXXvw&usqp=CAU"
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0UeUWDBSRAg77snLd2UJECWxR0rRMpMXXvw&usqp=CAU"
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0UeUWDBSRAg77snLd2UJECWxR0rRMpMXXvw&usqp=CAU"
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0UeUWDBSRAg77snLd2UJECWxR0rRMpMXXvw&usqp=CAU"
  ];
  List<double> prices = <double>[
    100,
    200,
    300,
    400,
    500,
  ];
  AppBarWedget appBarWedget = AppBarWedget(
    title: '',
    onPressed: () {}, actions: [],
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: appBarWedget.ScaffoldKey,
        appBar: AppBarWedget( title: 'Cart',
          onPressed: () {
            appBarWedget.ScaffoldKey.currentState!.openDrawer();
          }, actions: [Padding(
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
              icon: const Icon(
                Icons.search,
              ),
            ),
          ),
          Constant.sizedBoxH,
          GestureDetector(
            onTap: () {
              Get.to(CartView());
            },
            child: Stack(
              children: const [
                Icon(
                  Icons.shopping_cart,
                  size: 26.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    )],
        ),
      drawer: DrawerWedget(),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.0))),
                    height: 140,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11.0),
                          child: Container(
                            width: 140,
                            child: Image.network("${images[0]}"),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${names[index]}',style: const TextStyle(
                                fontSize: 22,fontWeight: FontWeight.bold
                              ),),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                '${prices[index]}',
                                style: const TextStyle(color: Colors.teal,
                                    fontSize: 17,fontWeight: FontWeight.normal
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                width: 130,
                                color: Colors.grey.shade200,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.add,
                                    color: Colors.black,),
                                    Constant.sizedBoxW,
                                    Text('1',style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),),
                                    Constant.sizedBoxW,
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 11.0),
                                      child: Icon(Icons.minimize , color: Colors.black,),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                            ],
                          ),
                        )
                      ],
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 15,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 30.0 ,bottom: 11 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Total' ,style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                      ),
                      SizedBox(height: 7,),
                      Text('\$ 2000', style: TextStyle(
                        color: Colors.teal,fontSize: 22
                      ),),
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.teal)
                            )
                        )
                    ),
                  onPressed: (){},
                  child: const Padding(
                    padding: EdgeInsets.all(11.0),
                    child: Text('Checkout',
                    style: TextStyle(
                      fontSize: 18,
                    color: Colors.white,
                ),),
                  ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
