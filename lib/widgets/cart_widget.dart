



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'h_additem_icon.dart';

class CartWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 11,
        height: 11,
        child: Stack(
          children: const [
            Icon(
              Icons.shopping_cart,
              size: 26.0,
              color: Colors.black,
            ),
          ],
        ),
    );
  }

}