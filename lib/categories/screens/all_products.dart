import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/categories/controller/product_controller.dart';
import 'package:fresh_in/categories/services/product_services.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/widgets/custom_button.dart';
import 'package:fresh_in/widgets/custom_text.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../constant.dart';

class AllProducts extends GetWidget<ProductController> {
  final FirebaseServices firebaseService = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWedget(
        actions: [],
        title: '',
        onPressed: () {},
      ),
      body: Wrap(
        children: [
          Column(
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
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GetBuilder<ProductController>(
                  builder: (controller) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 0,
                      mainAxisExtent: 400,
                    ),
                    itemCount: controller.productModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(-1.0),
                          side: const BorderSide(
                            color: Colors.white,
                            width: 0.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                  controller.productModel[index].image
                                      .toString(),
                                  fit: BoxFit.fill,
                                  height: 250,
                                ),
                                const Positioned(
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 25,
                                    color: Constant.iconColor,
                                  ),
                                  top: 10,
                                  left: 4,
                                ),
                                Positioned(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 13.0,
                                        right: 13.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: Text(
                                      'Discount ${controller.productModel[index].discount.toString()} %',
                                      style: const TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    color: Colors.white,
                                  ),
                                  bottom: 10,
                                  right: -2,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: CustomText(
                                    text2: '     ${controller.productModel[index].name.toString()}')),
                            const SizedBox(
                              height: 3,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                '  ${controller.productModel[index].shortDescription}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Align(
                              alignment:Alignment.bottomLeft,
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                width:double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white, //background color of button
                                      side: const BorderSide(
                                        width: 1.0,
                                        color: Constant.mainColor,
                                      ),
                                    ),
                                    onPressed: (){},
                                    child: const Text('Add to The Cart',
                                      style: TextStyle(
                                      color: Constant.mainColor
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
