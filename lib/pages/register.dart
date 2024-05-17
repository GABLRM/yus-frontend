import 'package:flutter/material.dart';
import 'package:yus_dev/widgets/form/register_form_widget.dart';
import 'package:yus_dev/widgets/title/app_title.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            BackButton(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      MainTitle(),
                      Text(
                        'Création de votre compte ',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Enregistrez-vous pour continuer',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                RegisterForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
