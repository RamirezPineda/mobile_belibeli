import 'package:app_belibeli/constants/constants.dart';
import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/utils/utils.dart';

class OrderService {
  Future<Map<String, dynamic>> createPayment(CreateOrder dataPayment) async {
    Map<String, dynamic> response =
        await HttClient.post(Endpoints.createPayment, dataPayment.toMap());
    final data = response[ResponseApi.data];
    return data ?? {};
  }

  Future<Map<String, dynamic>> createOrderPayment(CreateOrder dataOrder) async {
    Map<String, dynamic> response =
        await HttClient.post(Endpoints.createPayment, dataOrder.toMap());
    final data = response[ResponseApi.data];
    return data ?? {};
  }
}
