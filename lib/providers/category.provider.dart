import 'package:flutter/material.dart';
import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/services/services.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryService _categoryService;

  late List<Category> categories;
  late bool _isLoading;
  int categorySelected = 0;

  CategoryProvider(this._categoryService) {
    categories = [];
    _isLoading = false;
  }

  bool get isLoading => _isLoading;

  Future<void> getAllCategories() async {
    _isLoading = true;
    notifyListeners();
    categories = await _categoryService.getAllCategories();
    _isLoading = false;
    notifyListeners();
  }

  Product getProductById(String id) {
    for (var category in categories) {
      int? index = category.product?.indexWhere((product) => product.id == id);
      if (index != null && index != -1) {
        return category.product![index];
      }
    }

    return Product.productEmpty();
  }
}
