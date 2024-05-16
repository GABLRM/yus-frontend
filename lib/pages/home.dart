import 'package:flutter/material.dart';
import 'profil.dart'; // Assurez-vous d'importer votre page profil

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[50],
        leading: IconButton(
          icon: const Icon(Icons.add, color: Colors.black),
          onPressed: () {
            // mettre la page associé pour créer une nouv publi
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Spacer(),
            Text(
              "Yu's",
              style: TextStyle(color: Colors.black, fontFamily: 'MeriendaOne'),
            ),
            Spacer(),
          ],
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProfilPage()), // Naviguer vers la page Profil
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/img/pdpexemple.jpg', // Mis à jour pour utiliser AssetImage
                  width: 40, // Largeur ajustée à une taille plus visible
                  height: 40, // Hauteur ajustée à une taille plus visible
                  fit: BoxFit.cover, // Pour remplir correctement le cercle
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFEFCF3),
      body: ListView(
        children: <Widget>[
          postCard(
              'assets/img/photopubli1.jpg', 'Cléclé33', 'assets/img/pdp1.png'),
          postCard(
              'assets/img/photopubli2.jpg', 'HugoBdx', 'assets/img/pdp2.jpg'),
          // ça représente les publications
        ],
      ),
    );
  }

  Widget postCard(String imageUrl, String userName, String profileImageUrl) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: 400,
            height: 300, // Définissez la hauteur désirée
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                  profileImageUrl), // Utiliser une image différente pour la photo de profil
            ),
            title: Text(
              userName,
              style: const TextStyle(fontFamily: 'MeriendaOne'),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ],
      ),
    );
  }
}
