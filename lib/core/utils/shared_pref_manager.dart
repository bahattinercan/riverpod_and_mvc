import 'package:riverpod_and_mvc_case/models/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static late SharedPreferences shared;

  static Future<RegisterModel?> getRegister() async {
    var sharedUser = shared.getString("register");
    if (sharedUser == null) return null;
    return RegisterModel.fromRawJson(sharedUser);
  }

  static Future<bool> setRegister(RegisterModel? value) async {
    return shared.setString("register", value == null ? "" : value.toRawJson());
  }
}
