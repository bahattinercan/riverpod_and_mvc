import 'package:flutter/material.dart';
import 'package:riverpod_and_mvc_case/core/constants/dimensions.dart';
import 'package:riverpod_and_mvc_case/core/utils/dialogs.dart';
import 'package:riverpod_and_mvc_case/core/utils/validator.dart';
import 'package:riverpod_and_mvc_case/pages/register_page.dart';
import 'package:riverpod_and_mvc_case/pages/users_page.dart';
import 'package:riverpod_and_mvc_case/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailText = new TextEditingController();
  final TextEditingController passwordText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT),
                    child: Text(
                      "Login Page",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  TextFormField(
                    controller: emailText,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: Validator.baseValidator,
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  TextFormField(
                    controller: passwordText,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: Validator.baseValidator,
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: login,
                      child: Text('Login'),
                    ),
                  ),
                  // SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                  // SizedBox(
                  //   width: 200,
                  //   height: 50,
                  //   child: TextButton(
                  //     onPressed: signin,
                  //     child: Text('Sign in'),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Dialogs.showLoading();
    bool result = await AuthService.instance.register(email: emailText.text, password: passwordText.text);
    Dialogs.hideLoading();

    if (result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) {
          return UsersPage();
        }),
      );
    } else {
      Dialogs.failAlert();
    }
  }

  void signin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) {
        return RegisterPage();
      }),
    );
  }
}
