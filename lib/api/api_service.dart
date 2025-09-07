import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/user_model.dart';

class ApiService {
  static const String _baseUrl = 'https://dummyjson.com';

  Future<User?> login(String username, String password) async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));

    if (username == 'test' && password == 'password') {
      return User(id: '1', username: 'test');
    }
    return null;
  }

  Future<bool> changePassword(
      String userId, String currentPassword, String newPassword) async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<http.Response> checkIn(String userId, double latitude, double longitude) {
    return http.post(
      Uri.parse('$_baseUrl/posts/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userId': userId,
        'latitude': latitude,
        'longitude': longitude,
        'timestamp': DateTime.now().toIso8601String(),
      }),
    );
  }
}
