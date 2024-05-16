import 'package:flutter/material.dart';
import 'package:yus_dev/pages/authentication.dart';
import 'package:yus_dev/pages/home.dart';
import 'package:yus_dev/pages/login.dart';
import 'package:yus_dev/pages/information.dart';
import 'package:yus_dev/pages/inscription.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yu's",
      theme: ThemeData(
        fontFamily: 'Merienda',
        scaffoldBackgroundColor: Colors.yellow[50],
      ),
      initialRoute: '/login',
      routes: {
        '/authentication': (context) => const AuthenticationPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/information': (context) => const InformationPage(),
        '/inscription': (context) => const InscriptionPage(),
      },
    );
  }
}
