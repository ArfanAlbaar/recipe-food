import 'package:foodrecipeapp/app/StorageService.dart';
import 'package:foodrecipeapp/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../admin_service.dart';

class AdminController extends GetxController {
  var isLoading = false.obs;
  var isLoggedIn = false.obs;

  final StorageService _storage = StorageService();
  @override
  void onInit() {
    super.onInit();
    final token = _storage.readToken();
    isLoggedIn(token != null);
  }

  //LOGIN
  Future<void> loginAdmin(String username, String password) async {
    isLoading(true);
    final token = await AdminService.loginAdmin(username, password);

    if (token != null) {
      isLoggedIn(true);
      Get.offAllNamed(Routes.ADMIN);
    } else {
      Get.snackbar('Error', 'Login gagal');
    }
    isLoading(false);
  } //END LOGIN

  final AdminService _adminService = AdminService();
  Future<void> logoutAdmin() async {
    isLoading(true);
    await _adminService.logout();
    _storage.removeToken();
    isLoggedIn(false);
    isLoading(false);
    Get.offAllNamed(Routes.HOME);
  }

  final count = 0.obs;
  void increment() => count.value++;
}
