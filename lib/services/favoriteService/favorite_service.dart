import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sezon_app/models/products_model.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';

class FavoriteService {
  static FavoriteService get instance => FavoriteService();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getAllFavorite() async {
    try {
      var snapshot = await _firestore
          .collection('favorites')
          .where('userId', isEqualTo: SharedPrefController().getId())
          .get();

      List<ProductModel> favoriteProduct =
          snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      return favoriteProduct;
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }

  addToFavorite(ProductModel productModel) async {
    try {
      await _firestore
          .collection('favorites')
          .add(productModel.toJson(uId: SharedPrefController().getId()));
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteFromFavorite(String id) async {
    try {
      await _firestore.collection('favorites').doc(id).delete();
      print('deleted successfully');
    } on Exception catch (e) {
      print(e);
    }
  }
}
