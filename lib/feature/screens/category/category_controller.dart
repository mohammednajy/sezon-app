import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sezon_app/models/products_model.dart';

import '../../../models/categoy_model.dart';
import '../../../services/homeServices/homeServices.dart';

class CategoryController extends GetxController {
  int selectedIndex = 0;

  List<CategoryModel> categories = [];
  List<ProductModel> allProducts = [];
  List<ProductModel> productsCategory = [];

  bool loading = false;
  bool cateogyloading = false;

  getCategories() async {
    loading = true;
    update();
    categories = await HomeService.instance.getCategories();
    getProductsCategory(categoryId: categories[0].id);
    update();
    loading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  changedIndex(int value) {
    selectedIndex = value;
    update();
  }

  // getAllProducts() async {
  //   loading = true;
  //   update();
  //   allProducts = await HomeService.instance.getAllProducts();

  //   update();
  //   loading = false;
  //   update();
  // }

  getProductsCategory({required String categoryId}) async {
    cateogyloading = true;
    update();
    List<ProductModel> newProductsList = [];
    List<ProductModel> data = await HomeService.instance.getAllProducts();
    for (ProductModel item in data) {
      print(categoryId);
      print(item.id);
      if (categoryId == item.category) {
        newProductsList.add(item);
        update();
      }
    }
    productsCategory = newProductsList;
    update();
    cateogyloading = false;
    update();
  }
}
