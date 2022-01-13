import 'package:flutter/material.dart';
import 'package:fresh_in/categories/controller/top_products_controller.dart';
import 'package:fresh_in/categories/services/top_products_services.dart';
import 'package:fresh_in/categories/widgets/category_vertical_card.dart';
import 'package:fresh_in/widgets/custom_text.dart';
import 'package:fresh_in/widgets/h_additem_icon.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../constant.dart';

class VerticalCards extends GetWidget<TopProductsController> {
  final TopProServices topProServices = TopProServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GetBuilder<TopProductsController>(
          builder: (controller) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 265,
            ),
            itemCount: controller.topProductModel.length,
            itemBuilder: (BuildContext context, int index) {
              var number;
              return Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 0.3,
                  ),
                ),
                child: Column(
                  children: [
                    Image.network(
                      controller.topProductModel[index].image.toString(),
                      fit: BoxFit.fill,
                      height: 160,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text2:
                              controller.topProductModel[index].name.toString(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '${controller.topProductModel[index].price.toString()}' +
                              ' L.E',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: addItemPage(
                        number:
                            '${controller.topProductModel[index].addNum.toString()}',
                      ),
                      width: double.infinity,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

