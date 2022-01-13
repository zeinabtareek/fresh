import 'package:flutter/material.dart';
import 'package:fresh_in/widgets/h_additem_icon.dart';

enum AddStatue {
  ITEM_ADDED,
  NO_ITEM_ADDED,
}
bool addRemark =false;
bool CardAppeared =false;
AddStatue currentState =AddStatue.NO_ITEM_ADDED;
GreenAddRemark(){
  return Icon(Icons.circle ,color: Colors.green,size: 14,);
}
NoAddRemark(){
  return Icon(Icons.circle ,color: Colors.grey,size: 14,);
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double _size = 50.0;
  bool _large = false;
  int number =0;
  bool addRemark =false;
  void incrementCounter(){
    setState(() {
      number++;
      currentState =AddStatue.ITEM_ADDED;
      addRemark=true ;
      CardAppeared =true;
      updateSize();
    });
  }
  void DecrementCounter(){
    if(number>=1) {
      setState(() {
        number--;
        currentState = AddStatue.ITEM_ADDED;
        addRemark=true;
      });
    }
    else if(number==0){
      setState(() {
        currentState ==AddStatue.NO_ITEM_ADDED;
        _large = _large;

      });
    }
    else {
      number=number;
    }
  }
  GreenAddRemark(){
    return Icon(Icons.circle ,color: Colors.green,);
  }
  void  updateSize() {
    setState(() {
      _size = _large ?
      50.0 :
      250.0;
      // _large = !_large;
    });
  }
  void _reupdateSize() {
    setState(() {
      _size = _large ?
      250.0 :
      100.0 ;
      ii()?
          yy():yy();
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => updateSize(),
      child: Container(
        color: Colors.amberAccent,
        child: AnimatedSize(
          curve: Curves.easeIn,
          duration: const Duration(seconds: 1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(width: _size,
                  child: currentState ==AddStatue.ITEM_ADDED?
                  ii():addRemark==true?
                  GreenAddRemark():
                  yy(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  ii(){
    setState(() {
      addRemark==true;
    });
     Center(
        child:  SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed:  incrementCounter,
                      icon: Icon(Icons.add_circle_outline_rounded,size: 30,),color: Colors.grey,
                    ),
                    Text('${number }'),
                    IconButton(
                      onPressed:  DecrementCounter,
                      icon: Icon(Icons.remove_circle_outline,size: 30,),color: Colors.grey,
                    ),
                  ],
                ),
                Container(
                  child:addRemark==true?
                  GreenAddRemark():
                  NoAddRemark(),
                ),
              ],
            ),
          ),
        );
  }
  yy(){
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(''),
          SizedBox(height: 22,),
          IconButton(
            onPressed:  incrementCounter,
            icon: Icon(Icons.add_circle_outline_rounded,size: 30,),color: Colors.grey,
          ),
        ],
      ),
    );
  }
}


