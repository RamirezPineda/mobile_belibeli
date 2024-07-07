import 'dart:convert';

import 'package:app_belibeli/models/models.dart';

class Category {
  String id;
  String name;
  String imageUrl;
  String? description;
  List<Product>? product;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.description,
    this.product,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "description": description,
        "product": product,
      };

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        imageUrl: json['imageUrl'],
        description: json["description"],
        product: json["product"] != null
            ? List<Product>.from(
                json['product'].map((prodJson) => Product.fromMap(prodJson)))
            : null,
      );
}
