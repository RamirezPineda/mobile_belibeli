import 'package:flutter/material.dart';

import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/services/services.dart';

class OrderProvider extends ChangeNotifier {
  final OrderService _orderService;
  bool _isLoading = false;

  OrderProvider(this._orderService);

  bool get isLoading => _isLoading;

  Future<void> makePayment(List<ShoppingCart> shoppingCart) async {
    _isLoading = true;
    notifyListeners();
    final response = await _orderService.createPayment(shoppingCart);

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Client secret key from payment data
        paymentIntentClientSecret: response['client_secret'],
        style: ThemeMode.light,
        googlePay: const PaymentSheetGooglePay(
          testEnv: true,
          currencyCode: "USD",
          merchantCountryCode: "US",
        ),
        merchantDisplayName: 'Flutter Ecommerce BeliBeli',
        returnURL: 'flutterstripe://redirect',
      ),
    );
    _isLoading = false;
    notifyListeners();
  }

  Future<Map<String, dynamic>> createPayment(
      List<ShoppingCart> shoppingCart) async {
    return _orderService.createPayment(shoppingCart);
  }

  Future<Map<String, dynamic>> createOrderPayment(
      List<ShoppingCart> shoppingCart) async {
    _isLoading = true;
    notifyListeners();
    final response = await _orderService.createOrderPayment(shoppingCart);
    _isLoading = false;
    notifyListeners();
    return response;
  }
}
