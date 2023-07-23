import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sezon_app/models/products_model.dart';

import '../../../models/categoy_model.dart';
import '../../../services/homeServices/homeServices.dart';

class CategoryController extends GetxController {
  int selectedIndex = 0;

  List<CategoryModel> categories = [];
  List<ProductModel> allProducts = [];

  bool loading = false;
  getCategories() async {
    loading = true;
    update();
    categories = await HomeService.instance.getCategories();
    update();
    loading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getAllProducts();
  }

  changedIndex(int value) {
    selectedIndex = value;
    update();
  }

  getAllProducts() async {
    loading = true;
    update();
    allProducts = await HomeService.instance.getAllProducts();

    update();
    loading = false;
    update();
  }
}
