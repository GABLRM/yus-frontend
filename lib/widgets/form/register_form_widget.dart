import 'package:flutter/material.dart';
import 'package:yus_dev/utils/authentication_verification.dart';
import 'package:yus_dev/widgets/button/app_button.dart';
import 'package:yus_dev/widgets/input/app_input_label.dart';
import 'package:yus_dev/repositories/user_repository.dart';
import 'package:yus_dev/widgets/snackBar/app_custom_snackbar.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<RegisterForm> {
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController firstnameController = TextEditingController();
  late TextEditingController lastnameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
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
            LabelInput(label: 'Pseudo', controller: usernameController),
            const SizedBox(
              height: 20,
            ),
            LabelInput(label: 'Prénom', controller: firstnameController),
            const SizedBox(
              height: 20,
            ),
            LabelInput(label: 'Nom', controller: lastnameController),
            const SizedBox(
              height: 20,
            ),
            LabelInput(label: 'Adresse mail', controller: emailController),
            const SizedBox(
              height: 20,
            ),
            LabelInput(label: 'Mot de passe', controller: passwordController),
            const SizedBox(
              height: 20,
            ),
            LabelInput(
                label: 'Confirmez votre mot de passe',
                controller: confirmController),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              text: "Inscription",
              press: () {
                registerUser(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void registerUser(BuildContext context) {
    String errorMessage = verificationRegisteringAccount(
        usernameController.text,
        firstnameController.text,
        lastnameController.text,
        emailController.text,
        passwordController.text,
        confirmController.text);

    if (errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackBarContent(
            errorText: errorMessage,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    } else {
      register(
        usernameController.text,
        firstnameController.text,
        lastnameController.text,
        emailController.text,
        passwordController.text,
      );}
  }
}
