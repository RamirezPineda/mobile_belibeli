import 'package:flutter/material.dart';
import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/services/services.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _productService;

  late List<Product> products;
  late bool _isLoading;

  ProductProvider(this._productService) {
    products = [];
    _isLoading = false;
  }

  bool get isLoading => _isLoading;

  Future<void> getAllProducts() async {
    _isLoading = true;
    notifyListeners();
    products = await _productService.getAllProducts();
    _isLoading = false;
    notifyListeners();
  }
}
