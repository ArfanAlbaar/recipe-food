import 'package:flutter/material.dart';
import 'package:foodrecipeapp/app/routes/app_pages.dart';
import 'package:foodrecipeapp/user_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final UserService userService = UserService();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  static String apiToken = "";
  bool isLoggedIn = false; // Add this variable

  //LOGIN
  Future<void> loginUser(
      BuildContext context, String username, String password) async {
    try {
      if (apiToken != "") {
        Get.snackbar("HEY", "YOU ALREADY LOGGED IN");
        return Get.offAllNamed(Routes.ADMIN);
      } else if (apiToken == "") {
        String token = await userService.loginUser(username, password);
        apiToken = token;
        print('Token: $token');
        isLoggedIn = true; // Update login status
        Get.offAllNamed(Routes.ADMIN);
      }
    } catch (e) {
      // Handle error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Error'),
            content: Text('Failed to login. Please check your credentials.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  } //END LOGIN

  //LOGOUT
  Future<void> logoutUser() async {
    try {
      print('token logout: $apiToken');

      if (apiToken == null) {
        Get.offAllNamed(Routes.LOGIN);
        throw Exception('Kamu belum login');
      }

      await userService.logoutUser(apiToken);
      apiToken = "";
      print('Token: $apiToken');
      isLoggedIn = false; // Update login status
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}
