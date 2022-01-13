

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DrawerControllerc extends GetxController {
  var isSelected =false.obs;
  var selectedIndexc= [].obs;
  var selectedIndex=0.obs;

  // toogle(int index) {
  //   isSelected.value = !isSelected.value;
  //   if (selectedIndex[index]==0) {
  //     selectedIndex.remove(index);
  //   } else {
  //     selectedIndex.add(index);
  //   }
  //   refresh();
  //
  // };


  pressed(int index) {
    selectedIndex.value=index ;
    // selectedIndexc.value=index as List;

    if (index==0) {
          selectedIndex.value!=0;
        } else {
      selectedIndex.value=0;
        }
    refresh();
  }



}