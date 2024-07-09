import 'package:app_belibeli/constants/constants.dart';
import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/utils/utils.dart';

class OrderService {
  Future<Map<String, dynamic>> createPayment(
      List<ShoppingCart> shoppingCart) async {
    List<CreateProductOrder> productOrder = [];

    for (var element in shoppingCart) {
      productOrder.add(CreateProductOrder(
          quantity: element.quantity, productId: element.product.id));
    }

    final orderData = CreateOrder(note: 'Payment', productOrder: productOrder);

    Map<String, dynamic> response =
        await HttClient.post(Endpoints.createPayment, orderData.toMap());
    final data = response[ResponseApi.data];

    return data ?? {};
  }

  Future<Map<String, dynamic>> createOrderPayment(
      List<ShoppingCart> shoppingCart) async {
    List<CreateProductOrder> productOrder = [];

    for (var element in shoppingCart) {
      productOrder.add(CreateProductOrder(
          quantity: element.quantity, productId: element.product.id));
    }

    final orderData = CreateOrder(
      note:
          'Thank you for choosing us for your purchase! We hope you enjoy your product. Please feel free to contact our customer support team if you need additional help or have any questions.',
      productOrder: productOrder,
    );

    Map<String, dynamic> response =
        await HttClient.post(Endpoints.createOrderPayment, orderData.toMap());
    final data = response[ResponseApi.data];

    return data ?? {};
  }
}
