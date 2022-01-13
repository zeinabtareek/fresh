import 'package:flutter/material.dart';
import 'package:fresh_in/categories/controller/product_controller.dart';
import 'package:fresh_in/categories/screens/all_products.dart';
import 'package:fresh_in/screens/product_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HorizontalCards extends StatelessWidget {
  ScrollController scrollController = ScrollController();
  final _controller = Get.put(ProductController());

  HorizontalCards({Key? key}) : super(key: key);
  final items=[
    'Fashion',
    'Health and Beauty',
    'Mobiles',
    'Electronics',
    'Home and Kitchen',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.0),
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(
                color: Colors.black,
                width: 0.3,
              ),
            ),
            child: InkWell(
              onTap: () {
                Get.to(AllProducts());
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: 160.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      // _controller.products[index].image!.toString(),
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuceKbWTvhY0PVAANcPUSC-ovekxTIsPpmxg&usqp=CAU',
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                     Text(items[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
