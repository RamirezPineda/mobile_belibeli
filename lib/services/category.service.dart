import 'package:app_belibeli/constants/constants.dart';
import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/utils/utils.dart';

class CategoryService {
  Future<List<Category>> getAllCategories() async {
    Map<String, dynamic> response =
        await HttClient.get('${Endpoints.categories}?order=asc');
    final data = response[ResponseApi.data];

    if (data != null) {
      final List<Category> categories = [];
      for (var category in data) {
        categories.add(Category.fromMap(category));
      }
      return categories;
    }

    return [];
  }
}
