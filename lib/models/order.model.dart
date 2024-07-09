import 'dart:convert';

class CreateProductOrder {
  int quantity;
  String productId;

  CreateProductOrder({
    required this.quantity,
    required this.productId,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "quantity": quantity,
        "productId": productId,
      };

  static Map<String, dynamic> toMapData(CreateProductOrder data) => {
        "quantity": data.quantity,
        "productId": data.productId,
      };
}

class CreateOrder {
  List<CreateProductOrder> productOrder;
  String note;

  CreateOrder({
    required this.note,
    required this.productOrder,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "note": note,
        "productOrder": List<Map<String, dynamic>>.from(productOrder
            .map((element) => CreateProductOrder.toMapData((element)))),
      };
}
