import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey, // remplacer couleur par pdp
              ),
              // mettre ici image profil
            ),
            SizedBox(height: 20),
            Text(
              'Pseudo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Nom et Prénom user
            Text(
              'Nom Prénom',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createpubli');
              },
              child: const Text('Ajouter une publication'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // nb publi affiché (à modif)
                itemBuilder: (context, index) {
                  // Remplacez ce contenu par vos publications réelles
                  return ListTile(
                    title: Text('Publication ${index + 1}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
