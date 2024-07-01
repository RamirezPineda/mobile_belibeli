import 'dart:convert';

import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/utils/utils.dart';

// ignore: constant_identifier_names
enum Department { MEN, WOMAN }

class Product {
  String id;
  String? brand;
  String creationDate;
  Department department;
  String description;
  String name;
  double price;
  List<String> sizes;
  String specification;
  int stock;
  double tax;
  String categoryId;
  String? discountId;
  String packageId;
  List<ProductImage> productImage;
  Discount? discount;
  Package? package;
  Category? category;

  Product({
    required this.id,
    required this.brand,
    required this.creationDate,
    required this.department,
    required this.description,
    required this.name,
    required this.price,
    required this.sizes,
    required this.specification,
    required this.stock,
    required this.tax,
    required this.categoryId,
    this.discountId,
    required this.packageId,
    required this.productImage,
    this.discount,
    this.package,
    this.category,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "brand": brand,
        "creationDate": creationDate,
        "department": department,
        "description": description,
        "name": name,
        "price": price,
        "sizes": sizes,
        "specification": specification,
        "stock": stock,
        "tax": tax,
        "categoryId": categoryId,
        "discountId": discountId,
        "packageId": packageId,
        "productImage": productImage,
        "package": package,
        "discount": discount,
        "category": category,
      };

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        brand: json["brand"],
        creationDate: json["creationDate"],
        department: json["department"] == Department.MEN.toString()
            ? Department.MEN
            : Department.WOMAN,
        description: json["description"],
        name: json["name"],
        price: TConverter.jsonToDouble(json["price"]),
        sizes: List<String>.from(json["sizes"].map((size) => size)),
        specification: json["specification"],
        stock: json["stock"],
        tax: TConverter.jsonToDouble(json["tax"]),
        categoryId: json["categoryId"],
        discountId: json["discountId"],
        packageId: json["packageId"],
        productImage: List<ProductImage>.from(json["productImage"]
            .map((productImageJson) => ProductImage.fromMap(productImageJson))),
        package:
            json["package"] != null ? Package.fromMap(json["package"]) : null,
        discount: json["discount"] != null
            ? Discount.fromMap(json["discount"])
            : null,
        category: json["category"] != null
            ? Category.fromMap(json["category"])
            : null,
      );
}
