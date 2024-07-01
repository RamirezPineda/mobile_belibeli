import 'package:app_belibeli/constants/constants.dart';
import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/utils/utils.dart';

class ProductFavoriteService {
  Future<List<Product>> getAllProductsFavorite() async {
    final response =
        await HttClient.get('${Endpoints.productsFavorites}?order=desc');
    final data = response[ResponseApi.data];

    final List<Product> products = [];

    if (data != null) {
      for (var productFavorite in data) {
        final favorite = ProductFavorite.fromMap(productFavorite);
        products.add(favorite.product);
      }
    }

    return products;
  }
}
