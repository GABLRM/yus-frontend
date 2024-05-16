import 'package:flutter/material.dart';
import 'profil.dart';

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
            // mettre page pour nouv publi
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
                    builder: (context) => ProfilPage()), // passage page profi
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
                  'assets/img/pdpexemple.jpg',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover, // Pour remplir cercle
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
          // ça représente les publications etc
        ],
      ),
    );
  }

  Widget postCard(String imageUrl, String userName, String profileImageUrl) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                  profileImageUrl), // Utiliser une image diff pour la photo de profil
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
