import 'package:flutter/material.dart';
import 'package:yus_dev/widgets/form/login_form_widget.dart';
import 'package:yus_dev/widgets/title/app_title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              BackButton(),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
            ],
          ),
        ),
      ),
    );
  }
}
