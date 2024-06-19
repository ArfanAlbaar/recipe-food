import 'dart:convert';

import 'package:http/http.dart' as http;

class RecipeService {
  static final String baseUrl = "http://localhost:8080/api/recipe";

  // final StorageService _storage = StorageService();
  //LIST
  Future<List<dynamic>> getListRecipe() async {
    // final url = Uri.parse('$baseUrl?category=$category');
    final url = Uri.parse('$baseUrl');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  // static Future<List<Food>> fetchFoods() async {
  //   final response = await http.get(Uri.parse('$baseUrl/foods'));
  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     return jsonResponse.map((food) => Food.fromJson(food)).toList();
  //   } else {
  //     throw Exception('Failed to load foods');
  //   }
  // }

  // Future<void> logout() async {
  //   final url = Uri.parse('$baseUrl/user/auth/logout');
  //   final token = StorageService().readToken();

  //   try {
  //     final response = await http.delete(
  //       url,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'API-TOKEN': token!,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       // Logout berhasil
  //       print('Logout berhasil');
  //     } else {
  //       // Handle error response
  //       print('Logout gagal dengan status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // Handle network error
  //     print('Error saat logout: $e');
  //   }
  // }
}
