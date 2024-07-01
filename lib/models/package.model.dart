import 'dart:convert';

import 'package:app_belibeli/utils/utils.dart';

class Package {
  String id;
  double high;
  double width;
  double length;
  double weight;

  Package({
    required this.id,
    required this.high,
    required this.width,
    required this.length,
    required this.weight,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "high": high,
        "width": width,
        "length": length,
        "weight": weight,
      };

  factory Package.fromMap(Map<String, dynamic> json) => Package(
        id: json["id"],
        high: TConverter.jsonToDouble(json["high"]),
        width: TConverter.jsonToDouble(json['width']),
        length: TConverter.jsonToDouble(json["length"]),
        weight: TConverter.jsonToDouble(json["weight"]),
      );
}
