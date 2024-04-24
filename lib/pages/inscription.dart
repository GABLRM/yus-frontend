import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'information.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({Key? key}) : super(key: key);

  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Merienda'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Inscription'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Bienvenue!',
                style: TextStyle(
                  fontFamily: 'Merienda',
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Si tu as moins de 15 ans,\ntu as besoin de tes parents pour nous rejoindre",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Merienda',
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Quel est ton âge",
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d{0,2}$')),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_ageController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Veuillez nous indiquer votre âge",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InformationPage()),
                    );
                  }
                },
                child: const Text('Valider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
