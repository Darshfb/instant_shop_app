import 'package:get/state_manager.dart';
import 'package:softagi/model/cart_model.dart';
import 'package:softagi/model/test.dart';
import 'package:softagi/services/test%20server.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList =<carttt>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try{
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if(products != null){
        productList.value = carttt as List<carttt>   ;
      }
    } finally {
      isLoading(false);
    }
  }
}