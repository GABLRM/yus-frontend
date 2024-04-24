import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRepository {
  Future<String> loginUser(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      var requestBody = json.encode({'email': email, 'password': password});

      try {
        var response = await http.post(
            Uri.parse('http://localhost:3000/users/auth/login'),
            headers: {'Content-Type': 'application/json'},
            body: requestBody);

        if (response.statusCode == 201) {
          // Si le code de statut est 201 (Créé), alors l'authentification a réussi
          var jsonResponse = json.decode(response.body);
          return jsonResponse['access_token'];
        } else if (response.statusCode == 401) {
          // Si le code de statut est 401 (Non autorisé), alors l'authentification a échoué
          return 'Login failed: Unauthorized';
        } else {
          // Si le code de statut n'est ni 201 ni 401, quelque chose d'autre s'est mal passé
          return 'Login failed with status code: ${response.statusCode}';
        }
      } on SocketException catch (e) {
        // Handle socket exceptions
        return 'SocketException: ${e.message}';
      } catch (e) {
        // Handle other exceptions
        return 'Error: $e';
      }
    }

    throw Exception('Invalid email or password');
  }
}
