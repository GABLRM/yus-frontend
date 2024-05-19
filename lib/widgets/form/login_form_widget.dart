import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yus_dev/utils/authentication_verification.dart';
import 'package:yus_dev/widgets/button/app_button.dart';
import 'package:yus_dev/widgets/input/app_input_label.dart';
import 'package:yus_dev/repositories/user_repository.dart';
import 'package:yus_dev/widgets/input/app_input_password.dart';
import 'package:yus_dev/widgets/snackBar/app_custom_snackbar.dart';

const storage = FlutterSecureStorage();

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
            PasswordInput(
              label: 'Mot de passe',
              controller: passwordController,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              text: "Connexion",
              press: () {
                loginUser(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    String errorMessage =
        verificationLoginAccount(emailController.text, passwordController.text);

    if (errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackBarContent(errorText: errorMessage),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    } else {
      final token = await login(emailController.text, passwordController.text);
      if (token.startsWith(RegExp('ey') )) {
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/home');
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomSnackBarContent(errorText: 'Email ou mot de passe incorrect'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
      }
    }
  }
}
