import 'package:fresh_in/categories/model/top_products_model.dart';
import 'package:fresh_in/categories/services/top_products_services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TopProductsController extends GetxController {
  final TopProServices topProServices = TopProServices();
  TopProductsController(){
    getAllTopController();
  }


  List<TopProductModel> get topProductModel=>_topProductModel;
  List<TopProductModel> _topProductModel =[];

  getAllTopController()async{
    topProServices.getAllTopServices().then((value) {
      for(int i =0 ; i<value.length ;i++){
        _topProductModel.add(TopProductModel.fromJson(value[i].data() as Map<String, dynamic> ));
      }
      print('the results are + ${_topProductModel.length}');
      update();
    });
  }

}
