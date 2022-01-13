import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../constant.dart';
enum AddStatue {
  ITEM_ADDED,
  NO_ITEM_ADDED,
}

bool CardAppeared = false;
double _size = 250;

AddStatue currentState = AddStatue.NO_ITEM_ADDED;

NoAddRemark() {
  return const Icon(
    Icons.circle,
    color: Colors.grey,
    size: 14,
  );
}

class addItemPage extends StatefulWidget {
  var number;

  // late var number ;

  addItemPage({required this.number});

  @override
  State<addItemPage> createState() => addItemPageState();
}

class addItemPageState extends State<addItemPage>
    with TickerProviderStateMixin {

  // int number = 0;
  bool addRemark = false;

  void incrementCounter() {
    setState(() {
      numberCon++;
      currentState = AddStatue.ITEM_ADDED;
      CardAppeared = true;
      updateSize();
    });
  }

  void DecrementCounter() {
    if (numberCon >= 1) {
      setState(() {
        // addRemark = true;
        CardAppeared = true;
        numberCon--;
        currentState = AddStatue.ITEM_ADDED;
        updateSize();
      });
    } else {
      numberCon = numberCon;
    }
  }

  double _size = 250.0;
  bool _large = false;

  void updateSize() {
    setState(() {
      _size = _large ? 250.0 : 250.0;
    });
  }

  void _reupdateSize() {
    setState(() {
      _size = _large ? 250.0 : 250.0;
      addAndMin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => updateSize(),
        child: Container(
            child: Column(children: [
                  Container(
            width: _size,
            child: currentState == AddStatue.NO_ITEM_ADDED
                ? add()
                : addAndMin(),
                  ),
                ],),));
        // )

    // );
  }

  addAndMin() {
    setState(() {});
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: incrementCounter,
            icon: const Icon(
              Icons.add_circle_outline_rounded,
              size: 22,
            ),
            color: Colors.grey,
          ),
          Text('$numberCon'),
          IconButton(
            onPressed: DecrementCounter,
            icon: const Icon(
              Icons.remove_circle_outline,
              size: 22,
            ),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
  add() {
    setState(() {});
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(''),

          IconButton(
            onPressed: incrementCounter,
            icon: const Icon(
              Icons.add_circle_outline_rounded,
              size: 22,
            ),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
