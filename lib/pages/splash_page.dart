import 'package:flutter/material.dart';
import 'package:riverpod_and_mvc_case/pages/login_page.dart';
import 'package:riverpod_and_mvc_case/pages/users_page.dart';
import 'package:riverpod_and_mvc_case/services/auth_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    autoRegister();

    super.initState();
  }

  Future<void> autoRegister() async {
    bool islogin = await AuthService.instance.checkToken();
    if (islogin) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) {
          return UsersPage();
        }),
        (_) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) {
          return LoginPage();
        }),
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.black),
        ),
      ),
    );
  }
}
