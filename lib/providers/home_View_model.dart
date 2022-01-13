
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeViewModel extends GetxController{
  int _navigatorValue =0;
  get navigatorValue =>_navigatorValue;
  void ChangeSelectedValue(int selectedValue){
    _navigatorValue =selectedValue;
    update();
  }
} 