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
      return Product.productEmpty();
    }

    return productsFavorite[productIndex];
  }

  Future<void> addOrRemoveFromFavorites(Product product) async {
    final index =
        productsFavorite.indexWhere((favorite) => favorite.id == product.id);
    if (index == -1) {
      productsFavorite.add(product);
      _productFavoriteService
          .addOrRemoveFromFavorites(product.id)
          .catchError((_) => productsFavorite.removeLast());
    } else {
      productsFavorite.removeAt(index);
      _productFavoriteService
          .addOrRemoveFromFavorites(product.id)
          .catchError((_) => productsFavorite.insert(index, product));
    }
    notifyListeners();
  }

  bool isFavorite(String productId) {
    return productsFavorite
            .indexWhere((favorite) => favorite.id == productId) !=
        -1;
  }
}
