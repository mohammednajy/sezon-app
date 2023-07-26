// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String details;
  final String image;
  final String name;
  final String price;
  final String id;
  final String? category;
  final String? userId;

  ProductModel({
    required this.category,
    required this.details,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    this.userId,
  });

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
        category: data['category'] ?? '',
        details: data['details'],
        id: document.id,
        image: data['image'],
        name: data['name'],
        price: data['price'],
        userId: data['userId'] ?? '');
  }

  Map<String, dynamic> toJson({required String uId}) => {
        "details": details,
        "image": image,
        "name": name,
        "price": price,
        "userId": uId,
        "id": id,
      };

  @override
  String toString() {
    return 'ProductModel(details: $details, image: $image, name: $name, price: $price, id: $id, category: $category, userId: $userId)';
  }
}
