import 'package:app_belibeli/constants/constants.dart';
import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/utils/utils.dart';

class AuthService {
  Future<Map<String, dynamic>> login(Auth auth) async {
    return await HttClient.post(Endpoints.login, auth.toMap());
  }
}
