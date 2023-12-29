import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_and_mvc_case/core/constants/api_constants.dart';
import 'package:riverpod_and_mvc_case/core/utils/shared_pref_manager.dart';
import 'package:riverpod_and_mvc_case/main.dart';
import 'package:riverpod_and_mvc_case/models/register_model.dart';
import 'package:riverpod_and_mvc_case/pages/login_page.dart';

class AuthService {
  AuthService._();

  static final instance = AuthService._();

  final url = ApiConstants.BASE_URL;

  Future<bool> register({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Dio().post(
        url + "register",
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      if (response.statusCode == 200) {
        SharedPrefManager.setRegister(RegisterModel.fromJson(response.data));
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout() async {
    bool result = await SharedPrefManager.setRegister(null);
    Navigator.pushAndRemoveUntil(
      navigationKey.currentContext!,
      MaterialPageRoute(builder: (_) {
        return LoginPage();
      }),
      (_) => false,
    );
    return result;
  }

  Future<bool> checkToken() async {
    try {
      RegisterModel? registerModel = await SharedPrefManager.getRegister();
      if (registerModel == null) {
        return false;
      }
      final response = await Dio().get(url + "users/${registerModel.id}");

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
