import 'package:late_pos/models/category_model.dart';

abstract class ICategoryRepository {
  List<CategoryModel> getAllCategories();

  Future<List<CategoryModel>> getCategories();
}