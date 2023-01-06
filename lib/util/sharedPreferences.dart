import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();  
}

class UserPreferencesManager {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> didLoginSuccess(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('access-token', token);
    prefs.setString('access-token', token).then((bool success) {
      return;
    });
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access-token');
  }

  void setRememberPassword(bool rememberPassword) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberPassword', rememberPassword);
  }

}
