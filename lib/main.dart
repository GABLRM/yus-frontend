import 'package:flutter/material.dart';
import 'package:yus_dev/pages/authentication.dart';
import 'package:yus_dev/pages/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/': (context) => const AuthenticationPage(),
          '/login': (context) => const LoginPage()
        },
        title: "Yu's",
        theme: ThemeData(scaffoldBackgroundColor: Colors.yellow[50]),
        home: const AuthenticationPage());
  }
}
