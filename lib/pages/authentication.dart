import 'package:flutter/material.dart';
import 'package:yus_dev/pages/login.dart';
import 'package:yus_dev/widgets/button/app_button.dart';
import 'package:yus_dev/widgets/title/app_title.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: MainTitle()
            ),
            const SizedBox(
              height: 100,
            ),
            CustomButton(
              text: 'Connexion',
              press: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: "Inscription",
              press: () => {
                Navigator.pushNamed(context, '/login')
              },
            ),
          ],
        ),
      ),
    );
  }
}
