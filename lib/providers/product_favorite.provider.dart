import 'package:flutter/material.dart';

import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/services/services.dart';

class ProductFavoriteProvider extends ChangeNotifier {
  final ProductFavoriteService _productFavoriteService;

  late List<Product> productsFavorite;
  late bool _isLoading;

  ProductFavoriteProvider(this._productFavoriteService) {
    productsFavorite = [];
    _isLoading = false;
  }

  bool get isLoading => _isLoading;

  Future<void> getAllProductsFavorite() async {
    _isLoading = true;
    notifyListeners();
    productsFavorite = await _productFavoriteService.getAllProductsFavorite();
    _isLoading = false;
    notifyListeners();
  }

  Product getProductById(String id) {
    int productIndex =
        productsFavorite.indexWhere((product) => product.id == id);

    if (productIndex == -1) {
      return Product(
        id: '',
        brand: '',
        creationDate: '',
        department: Department.MEN,
        description: '',
        name: '',
        price: 0,
        sizes: [],
        specification: '',
        stock: 0,
        tax: 0,
        categoryId: '',
        packageId: '',
        productImage: [],
        package: Package(id: '', high: 0, weight: 0, length: 0, width: 0),
      );
    }

    return productsFavorite[productIndex];
  }
}
