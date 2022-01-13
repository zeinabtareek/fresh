import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  double radius ;
  double borderWidth;
    String image ;
   CustomCircleAvatar({
     this.radius=35,
     this.borderWidth =3,
      this.image=  'https://img.freepik.com/free-photo/product-package-boxes-shopping-bag-cart-with-laptop-online-shopping-delivery-concept_38716-138.jpg?size=626&ext=jpg',
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white24,
      child: CircleAvatar(
        radius: radius - borderWidth,
        backgroundColor: Colors.grey,
        child: CircleAvatar(
          radius: radius - 2 * borderWidth,
          backgroundImage: NetworkImage(image)
        ),
      ),
    );
  }
}
