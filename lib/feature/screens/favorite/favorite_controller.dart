import 'package:get/get.dart';
import 'package:sezon_app/models/products_model.dart';
import 'package:sezon_app/services/favoriteService/favorite_service.dart';

class FavoriteController extends GetxController {
  List<ProductModel> favorites = [];
  bool loading = false;
  @override
  void onInit() {
    super.onInit();

    getFavorite();
  }

  getFavorite() async {
    loading = true;
    update();
    favorites = await FavoriteService.instance.getAllFavorite();
    update();
    loading = false;
    update();
  }

  deleteFavorite(String id) async {
    favorites.removeWhere((element) => element.id == id);
    update();
    await FavoriteService.instance.deleteFromFavorite(id);
    update();
  }

  addToFavorites(ProductModel productModel) async {
    try {
      favorites.add(productModel);
      update();
      await FavoriteService.instance.addToFavorite(productModel);
    } catch (e) {
      print(e);
    }
  }
}
