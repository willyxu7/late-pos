import 'package:late_pos/models/product_model.dart';

abstract class IProductRepository {
  List<ProductModel> getAllProducts();

  Future<List<ProductModel>> getProducts();
}