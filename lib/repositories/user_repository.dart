import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<http.Response> register(String username, String firstname,
    String lastname, String email, String password) async {
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
    final body = jsonDecode(response.body);
    await storage.write(key: 'token', value: body['access_token']);
    return response;
  }
  return register;
}

Future<http.Response> login(String email, String password) async {
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
  print(response.body);
  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    await storage.write(key: 'token', value: body['access_token']);
  }
  return response;
}
