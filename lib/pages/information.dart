import 'package:flutter/material.dart';
import 'login.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Inscription'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    "Si tu as moins de 15 ans,\ntu as besoin de tes parents pour nous rejoindre",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Information utilisateur principal",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(labelText: 'Pseudo :'),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(labelText: 'Prénom* :'),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Nom de famille* :'),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(labelText: 'Mot de passe :'),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Confirmation mot de passe :'),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Déjà un compte? ',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Naviguer vers la page de connexion
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text('Se connecter'),
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData(fontFamily: 'Merienda'),
    );
  }
}
