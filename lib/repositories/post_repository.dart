import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yus_dev/classes/post.dart';
import 'package:http/http.dart' as http;

const storage = FlutterSecureStorage();

Future<Post> fetchPosts() async {
  final token = await storage.read(key: 'token');
  final response = await http.get(
      Uri.parse('http://localhost:9001/posts/6649d1c03164eb9e620b09c6'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      });

  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load post');
  }
}
