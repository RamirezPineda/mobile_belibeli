import 'dart:convert';

class ProductImage {
  String id;
  String url;
  String productId;

  ProductImage({
    required this.id,
    required this.url,
    required this.productId,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "productId": productId,
      };

  factory ProductImage.fromMap(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        url: json["url"],
        productId: json["productId"],
      );
}
