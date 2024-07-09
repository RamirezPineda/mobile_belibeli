import 'package:flutter/material.dart';
import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/services/services.dart';

class OrderProvider extends ChangeNotifier {
  final OrderService _orderService;
  bool _isLoading = false;

  OrderProvider(this._orderService);

  bool get isLoading => _isLoading;

  Future<Map<String, dynamic>> createPayment(CreateOrder dataPayment) async {
    _isLoading = true;
    notifyListeners();
    final response = await _orderService.createPayment(dataPayment);
    _isLoading = false;
    notifyListeners();
    return response;
  }

  Future<Map<String, dynamic>> createOrderPayment(CreateOrder dataOrder) async {
    _isLoading = true;
    notifyListeners();
    final response = await _orderService.createOrderPayment(dataOrder);
    _isLoading = false;
    notifyListeners();
    return response;
  }
}
