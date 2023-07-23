import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sezon_app/models/categoy_model.dart';
import 'package:sezon_app/services/homeServices/homeServices.dart';

import '../../../models/products_model.dart';

class HomeController extends GetxController {
  List<CategoryModel> categories = [];
  bool loading = false;
  getCategories() async {
    loading = true;
    update();
    categories = await HomeService.instance.getCategories();
    update();
    loading = false;
    update();
  }

  List<ProductModel> allProducts = [];
  getAllProducts() async {
    loading = true;
    update();
    allProducts = await HomeService.instance.getAllProducts();

    update();
    loading = false;
    update();
  }

  @override
  void onInit() {
    getCategories();
    getAllProducts();
    super.onInit();
  }
}
