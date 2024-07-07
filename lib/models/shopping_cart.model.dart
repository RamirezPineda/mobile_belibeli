import 'dart:convert';

import 'package:app_belibeli/models/models.dart';

class ShoppingCart {
  int quantity;
  Product product;

  ShoppingCart({
    required this.quantity,
    required this.product,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "quantity": quantity,
        "product": product,
      };
}
