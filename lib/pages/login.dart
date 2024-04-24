import 'package:flutter/material.dart';
import 'package:yus_dev/widgets/loginForm/login_form_widget.dart';
import 'package:yus_dev/widgets/title/app_title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Merienda'),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Column(
                    children: [
                      MainTitle(),
                      Text(
                        'Connexion',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Connectez-vous pour continuer',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
