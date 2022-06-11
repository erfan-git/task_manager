import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  String KEYS_TOKEN = "keys_token";

  Future<bool> hasToken() {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    return prefs.then((prefs) {
      return prefs.getString(KEYS_TOKEN) != null;
    });
  }

  Future<bool> saveToken(String token) async{
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    return prefs.then((prefs) {
      return prefs.setString(KEYS_TOKEN, token);
    });
  }

  Future<bool> removeAll() {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    return prefs.then((prefs) {
      return prefs.clear();
    });
  }

  Future<String?> getToken() {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    return prefs.then((prefs) {
      return prefs.getString(KEYS_TOKEN);
    });
  }
}
