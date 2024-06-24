import 'dart:convert';

class Category {
  String id;
  String name;
  String imageUrl;
  String? description;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.description,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "description": description,
      };

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        imageUrl: json['imageUrl'],
        description: json["description"],
      );
}
