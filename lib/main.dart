import 'package:flutter/material.dart';
import 'package:yus_dev/pages/authentication.dart';
import 'package:yus_dev/pages/login.dart';
import 'package:yus_dev/pages/register.dart';
import 'package:yus_dev/widgets/navbar/app_bottom_navigation_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const CustomBottomNavigationBar(),
          '/register': (context) => const RegisterPage()
        },
        title: "Yu's",
        theme: ThemeData(scaffoldBackgroundColor: Colors.yellow[50]),
        home: const AuthenticationPage());
  }
}
