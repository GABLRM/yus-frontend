import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:yus_dev/classes/post.dart';
import 'package:http/http.dart' as http;

const storage = FlutterSecureStorage();

Future<List<Post>> fetchPosts() async {
  final token = await storage.read(key: 'token');
  final response =
      await http.get(Uri.parse('http://localhost:9001/posts/'), headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token'
  });
  if (response.statusCode == 200) {
    final decodedData = jsonDecode(response.body) as List<dynamic>;
    return decodedData.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}

Future<void> createPost(String title, String content) async {
  final token = await storage.read(key: 'token');
  final response = await http.post(
    Uri.parse('http://localhost:9001/posts/'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'content': content,
    }),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create post');
  }
}

Future<List<Post>> fetchPostUser() async {
  final token = await storage.read(key: 'token');
  if (token != null) {
    final decodeToken = JwtDecoder.decode(token);
    final response = await http.get(
        Uri.parse('http://localhost:9001/posts/user/${decodeToken['sub']}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body) as List<dynamic>;
      return decodedData.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  } else {
    throw Exception('Failed to load posts');
  }
}

Future<String> fetchUserPerPost(String id) async {
  final token = await storage.read(key: 'token');

  final response =
      await http.get(Uri.parse('http://localhost:9001/users/$id'), headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token'
  });
  if (response.statusCode == 200) {
    final decodedData = jsonDecode(response.body);
    return decodedData['username'];
  } else {
    throw Exception('Failed to load user');
  }
}
