import 'dart:convert';

import 'package:app_belibeli/models/models.dart';

class ProductFavorite {
  String id;
  String date;
  String hour;
  String productId;
  String userId;
  Product product;

  ProductFavorite({
    required this.id,
    required this.date,
    required this.hour,
    required this.userId,
    required this.productId,
    required this.product,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date,
        "hour": hour,
        "userId": userId,
        "productId": productId,
        "product": product,
      };

  factory ProductFavorite.fromMap(Map<String, dynamic> json) => ProductFavorite(
        id: json["id"],
        date: json["date"],
        hour: json["hour"],
        userId: json["userId"],
        productId: json["productId"],
        product: Product.fromMap(json["product"]),
      );
}
