import 'package:late_pos/models/product_model.dart';
import 'package:late_pos/repositories/product_repository_interface.dart';

class ProductRepository implements IProductRepository {
  @deprecated
  @override
  List<ProductModel> getAllProducts() {
    List<ProductModel> products;

    products = [
      ProductModel(
          id: 1, name: "Kopi Susu Es", price: "Rp 8000", category: "Kopi"),
      ProductModel(
          id: 2, name: "Kopi Susu Panas", price: "Rp 8000", category: "Kopi"),
      ProductModel(id: 3, name: "Teh Es", price: "Rp 5000", category: "Teh"),
    ];

    return products;
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [
      ProductModel(
          id: 1, name: "Kopi Susu Es", price: "Rp 8000", category: "Kopi"),
      ProductModel(
          id: 2, name: "Kopi Susu Panas", price: "Rp 8000", category: "Kopi"),
      ProductModel(id: 3, name: "Teh Es", price: "Rp 5000", category: "Teh"),
    ];

    return Future.delayed(const Duration(milliseconds: 3000), () => products);
  }
}
