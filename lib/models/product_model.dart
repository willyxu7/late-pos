import 'package:flutter/foundation.dart';

class ProductModel {
  final int id;
  final String name;
  final String category;
  final String price;
  int quantity;

  ProductModel({
    @required this.id,
    @required this.name,
    this.category,
    @required this.price,
    this.quantity = 1}
  );

  toString() {
    return "product: " +
        name +
        ", category: " +
        category +
        ", price" +
        price;
  }
}