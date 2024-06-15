import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  String baseUrl = "http://localhost:8080/api";

  //LOGIN
  Future<String> loginUser(String username, String password) async {
    final url = Uri.parse('$baseUrl/user/auth/login');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      String token = jsonResponse['data']['token']; // Extract the token
      return token;
    } else {
      throw Exception('Failed to login');
    }
  }

  //LOGOUT
  Future<String> logoutUser(String token) async {
    final url = Uri.parse('$baseUrl/user/auth/logout');
    try {
      final response = await http.delete(
        url,
        headers: <String, String>{'API-TOKEN': token},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        String success = jsonResponse['data'];
        return success;
      } else {
        throw Exception('Failed to logout');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
}
