import 'package:flutter/material.dart';
import 'package:yus_dev/widgets/button/app_button.dart';
import 'package:yus_dev/widgets/input/app_input_label.dart';
import 'package:yus_dev/repositories/user_repository.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LabelInput(
              label: 'Adresse mail',
              controller: emailController,
            ),
            const SizedBox(
              height: 50,
            ),
            LabelInput(
              label: 'Mot de passe',
              controller: passwordController,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              text: "Connexion",
              press: () {
                UserRepository()
                    .loginUser(emailController.text, passwordController.text);
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}