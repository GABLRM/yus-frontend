import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yus_dev/classes/user.dart';

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

Future<User> fetchUserConnected() async {
  final token = await storage.read(key: 'token');
  final response =
      await http.get(Uri.parse('http://localhost:9001/users/me'), headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer  $token',
  });

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load user');
  }
}

Future<void> updateUser(String username, String firstname, String lastname,
    String biography, String email, String password) async {
  final token = await storage.read(key: 'token');

  final Map<String, String> body = {};
  if (username != '') body['username'] = username;
  if (firstname != '') body['firstname'] = firstname;
  if (lastname != '') body['lastname'] = lastname;
  if (biography != '') body['biography'] = biography;
  if (email != '') body['email'] = email;
  if (password != '') body['password'] = password;

  final response = await http.put(
    Uri.parse('http://localhost:9001/users/me'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(body),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update user');
  }
}
