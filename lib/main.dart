import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_and_mvc_case/core/utils/shared_pref_manager.dart';
import 'package:riverpod_and_mvc_case/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

final navigationKey = GlobalKey<NavigatorState>();

void main() async {
  var binding = WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  binding.renderView.automaticSystemUiAdjustment = false;
  SharedPrefManager.shared = await SharedPreferences.getInstance();
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void deneme() {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: navigationKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}
