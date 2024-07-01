import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const token = 'token';
  static const id = 'id';
  static const name = 'name';
  static const email = 'email';
}

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();
  late SharedPreferences _prefs;

  factory UserPreferences() => _instance;

  UserPreferences._internal();

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get prefsUser => _prefs;

  String get token => _prefs.getString(LocalStorage.token) ?? '';
  String get id => _prefs.getString(LocalStorage.id) ?? '';
  String get email => _prefs.getString(LocalStorage.email) ?? '';
  String get name => _prefs.getString(LocalStorage.name) ?? '';

  set token(String token) => _prefs.setString(LocalStorage.token, token);
  set id(String id) => _prefs.setString(LocalStorage.id, id);
  set email(String email) => _prefs.setString(LocalStorage.email, email);
  set name(String name) => _prefs.setString(LocalStorage.name, name);

  static void saveUserPreferences(Map<String, dynamic> dataMap) {
    final prefs = UserPreferences();
    prefs.token = dataMap[LocalStorage.token];
    prefs.id = dataMap[LocalStorage.id];
    prefs.email = dataMap[LocalStorage.email];
    prefs.name = dataMap[LocalStorage.name];
  }

  void clearUser() {
    _prefs.setString(LocalStorage.token, '');
    _prefs.setString(LocalStorage.id, '');
    _prefs.setString(LocalStorage.email, '');
    _prefs.setString(LocalStorage.name, '');
  }

  static String getToken() {
    final prefs = UserPreferences();
    return prefs.token;
  }
}
