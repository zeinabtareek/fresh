

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:fresh_in/data.dart';

class carousel extends StatelessWidget {
  const carousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        viewportFraction: 1,
        autoPlay: true,
      ),
      items: imagesList
          .map(
            (item) => Center(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.network(
              item,
              height: 400,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ).toList(),
    );
  }
}

