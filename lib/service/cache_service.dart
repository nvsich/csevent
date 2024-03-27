import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const authTokenKey = 'authToken';
  static const noToken = "Пожалуйста, войдите заново!";

  Future<void> saveAuthToken(String authToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(authTokenKey, authToken);
  }

  Future<String> loadAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(authTokenKey) ?? noToken;
  }

  Future<void> deleteAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
