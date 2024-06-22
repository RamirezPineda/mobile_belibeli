import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:4000';
}
