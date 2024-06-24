import 'package:flutter/material.dart';
import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/services/services.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryService _categoryService;

  late List<Category> categories;
  late bool _isLoading;

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
}
