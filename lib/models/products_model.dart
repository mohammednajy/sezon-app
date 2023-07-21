// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String price;
  final String image;
  final String name;

  final String details;
  final String category;

  ProductModel({
    required this.category,
    required this.details,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  });

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
      category: data['category'],
      details: data['details'],
      id: document.id,
      image: data['image'],
      name: data['name'],
      price: data['price'],
    );
  }
}
