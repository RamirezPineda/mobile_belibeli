import 'dart:convert';

import 'package:app_belibeli/utils/utils.dart';

class Discount {
  String id;
  String name;
  double amount;

  Discount({
    required this.id,
    required this.name,
    required this.amount,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "amount": amount,
      };

  factory Discount.fromMap(Map<String, dynamic> json) => Discount(
        id: json["id"],
        name: json["name"],
        amount: TConverter.jsonToDouble(json['amount']),
      );
}
