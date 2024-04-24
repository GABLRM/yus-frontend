import 'package:flutter/material.dart';
import 'package:yus_dev/pages/authentication.dart';
import 'package:yus_dev/pages/home.dart';
import 'package:yus_dev/pages/login.dart';
import 'package:yus_dev/pages/information.dart';
import 'package:yus_dev/pages/inscription.dart';

void main() {
  runApp(const MainApp());
}

Widget build(BuildContext context) {
  return MaterialApp(
    home: const MainApp(),
    theme: ThemeData(fontFamily: 'Merienda'),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/information': (context) => const InformationPage(),
          '/inscription': (context) => const InscriptionPage(),
        },
        title: "Yu's",
        theme: ThemeData(scaffoldBackgroundColor: Colors.yellow[50]),
        home: const AuthenticationPage());
  }
}
