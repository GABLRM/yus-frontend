import 'package:flutter/material.dart';
import 'package:yus_dev/widgets/button/app_button.dart';
import 'package:yus_dev/widgets/title/app_title.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Merienda'),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: MainTitle(),
              ),
              SizedBox(height: 100),
              CustomButton(
                text: 'Connexion',
                press: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              SizedBox(height: 50),
              CustomButton(
                text: "Inscription",
                press: () => Navigator.pushNamed(context, '/inscription'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
