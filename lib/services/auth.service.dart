import 'package:app_belibeli/constants/constants.dart';
import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/utils/utils.dart';

class AuthService {
  Future<Map<String, dynamic>> login(Auth auth) async {
    Map<String, dynamic> response =
        await HttClient.post(Endpoints.login, auth.toMap());
    final data = response[ResponseApi.data];

    if (data != null) {
      final data = response[ResponseApi.data];

      data[LocalStorage.token] = response[LocalStorage.token];
      UserPreferences.saveUserPreferences(data);

      return data;
    } else {
      return response;
    }
  }
}
