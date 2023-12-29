import 'package:dio/dio.dart';
import 'package:riverpod_and_mvc_case/core/constants/api_constants.dart';
import 'package:riverpod_and_mvc_case/core/utils/dialogs.dart';
import 'package:riverpod_and_mvc_case/models/user_model.dart';

class UserService {
  UserService._();

  static final instance = UserService._();

  final url = ApiConstants.BASE_URL;

  Future<List<UserModel>?> getUsers() async {
    try {
      final response = await Dio().get(
        url + "users",
      );

      print("response ${response}");

      if (response.statusCode == 200) {
        var list = response.data["data"] as List;

        return list.map((e) => UserModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } on Exception catch (e) {
      Dialogs.failAlert(content: e.toString());
      print(e);
      return null;
    }
  }
}
