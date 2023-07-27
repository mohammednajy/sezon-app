import 'package:get/get.dart';
import 'package:sezon_app/models/products_model.dart';
import 'package:sezon_app/services/favoriteService/favorite_service.dart';

class FavoriteController extends GetxController {
  List<ProductModel> favorites = [];
  bool loading = false;
  @override
  void onInit() {
    print('objectobjectobjectobjectobjectobjectobjectobject');
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
    await FavoriteService.instance.deleteFromFavorite(id);
    await getFavorite();
    update();
  }
}
