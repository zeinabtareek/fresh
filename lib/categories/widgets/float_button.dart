import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/categories/screens/add_product_screen.dart';
import 'package:fresh_in/categories/widgets/category_all_v_cards.dart';
import 'package:fresh_in/constant.dart';
import 'package:get/get.dart';

class FloatActionButtonc extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatActionButtonc({
    Key? key, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Constant.mainColor,
      elevation: 12,
      onPressed: onPressed,
      tooltip: 'Add',
      child: const Icon(Icons.add),
    );
  }
}
