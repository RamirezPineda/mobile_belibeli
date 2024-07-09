import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:4000';
  static final stripePublicKey =
      dotenv.env['STRIPE_PUBLIC_KEY'] ?? 'your_public_ley';
}
