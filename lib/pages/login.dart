import 'package:flutter/material.dart';
import 'package:yus_dev/widgets/input/app_input_label.dart';
import 'package:yus_dev/widgets/title/app_title.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
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
        Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LabelInput(label: 'Adresse mail'),
              SizedBox(
                height: 50,
              ),
              LabelInput(label: 'Mot de passe'),
            ],
          ),
        ),
      ],
    )));
  }
}
