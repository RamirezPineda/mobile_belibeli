import 'package:app_belibeli/constants/constants.dart';
import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/utils/utils.dart';

class ProductService {
  Future<List<Product>> getAllProducts() async {
    final response = await HttClient.get('${Endpoints.products}?order=desc');
    final data = response[ResponseApi.data];

    final List<Product> products = [];

    if (data != null) {
      for (var product in data) {
        products.add(Product.fromMap(product));
      }
    }

    return products;
  }
}
