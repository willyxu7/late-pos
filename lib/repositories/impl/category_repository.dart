import 'package:late_pos/models/category_model.dart';
import 'package:late_pos/repositories/category_repository_interface.dart';

class CategoryRepository implements ICategoryRepository {
  @deprecated
  @override
  List<CategoryModel> getAllCategories() {
    List<CategoryModel> categories;

    categories = [
      CategoryModel(name: "Kopi"),
      CategoryModel(name: 'Teh'),
    ];

    return categories;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories;

    categories = [
      CategoryModel(name: "Kopi"),
      CategoryModel(name: 'Teh'),
    ];

    return Future.delayed(const Duration(milliseconds: 300), () => categories);
  }
}
