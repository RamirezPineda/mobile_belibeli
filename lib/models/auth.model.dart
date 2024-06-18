import 'dart:convert';

class Auth {
  String email;
  String password;

  Auth({
    required this.email,
    required this.password,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };
}
