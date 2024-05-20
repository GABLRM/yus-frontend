import 'package:flutter/material.dart';
import 'package:yus_dev/repositories/user_repository.dart';
import 'package:yus_dev/widgets/button/app_button.dart';
import 'package:yus_dev/widgets/input/app_input_label.dart';
import 'package:yus_dev/widgets/input/app_input_password.dart';
import 'package:yus_dev/widgets/snackBar/app_custom_snackbar.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController firstnameController = TextEditingController();
  late TextEditingController lastnameController = TextEditingController();
  late TextEditingController bioController = TextEditingController();
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
    bioController = TextEditingController();
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
    bioController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Paramètres",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: screenWidth,
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow[400]!, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    "Informations personnelles",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: screenWidth,
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow[400]!, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    "Biographie",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LabelInput(label: 'Biographie', controller: bioController),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: screenWidth,
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow[400]!, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    "Email",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LabelInput(
                      label: 'Nouvelle adresse mail',
                      controller: emailController),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: screenWidth,
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow[400]!, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    "Sécurité",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordInput(
                      label: 'Nouveau Mot de passe',
                      controller: passwordController),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordInput(
                    label: 'Confirmez votre nouveau mot de passe',
                    controller: confirmController,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "Sauvegarder",
              press: () {
                if (updateUser(
                        usernameController.text,
                        firstnameController.text,
                        lastnameController.text,
                        bioController.text,
                        emailController.text,
                        passwordController.text) ==
                    null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: CustomSnackBarContent(errorText: 'Erreur lors de la sauvegarde'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: CustomSnackBarContent(errorText: 'Sauvegarde réussie', containerColor: Colors.green, title: 'Super !',),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
