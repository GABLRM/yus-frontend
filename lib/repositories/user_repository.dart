import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<String> register(String username, String firstname, String lastname,
    String email, String password) async {
  final register = await http.post(
    Uri.parse('http://localhost:9001/users/auth/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
    }),
  );
  if (register.statusCode == 201) {
    return login(email, password);
  }
  throw Exception('Erreur lors de la creation du compte');
}

Future<String> login(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:9001/users/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {
      final body = jsonDecode(response.body);
      await storage.write(key: 'token', value: body['access_token']);
      return body['access_token'];
    } else {
      return 'Erreur lors de la connexion';
    }
  } catch (e) {
    return 'Erreur lors de la connexion';
  }
}
