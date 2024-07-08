import 'package:flutter/material.dart';
import 'package:app_belibeli/models/models.dart';

class ShoppingCartProvider extends ChangeNotifier {
  final List<ShoppingCart> shoppingCart = [];

  ShoppingCartProvider();

  void addToCart(Product product) {
    final index = _findById(product.id);

    if (index != -1) {
      shoppingCart[index].quantity += 1;
    } else {
      shoppingCart.add(ShoppingCart(quantity: 1, product: product));
    }

    notifyListeners();
  }

  void reduceCartQuantity(String id) {
    final index = _findById(id);

    if (index != -1) {
      shoppingCart[index].quantity -= 1;
      if (shoppingCart[index].quantity <= 0) {
        removeProduct(id);
      }
    }

    notifyListeners();
  }

  void removeProduct(String id) {
    final index = _findById(id);
    shoppingCart.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    shoppingCart.clear();
    notifyListeners();
  }

  double total() {
    double total = 0;
    for (var item in shoppingCart) {
      final product = item.product;
      total += calculatePrice(
            price: product.price,
            tax: product.tax,
            discount: product.discount?.amount,
          ) *
          item.quantity;
    }
    return total;
  }

  double calculatePrice(
      {required double price, required double tax, double? discount}) {
    final discountAmount = discount ?? 0;
    final taxValue = double.parse((tax * 0.01).toStringAsFixed(3));
    final priceWithDiscount = price - (price * discountAmount);
    return double.parse((priceWithDiscount + (priceWithDiscount * taxValue))
        .toStringAsFixed(2));
  }

  int _findById(String id) =>
      shoppingCart.indexWhere((item) => item.product.id == id);
}
