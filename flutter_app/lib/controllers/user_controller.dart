import 'package:get/get.dart';
import '../services/auth_service.dart';

class UserController extends GetxController {
  final AuthService _authService = AuthService();
  var username = 'Loading...'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsername();
  }

  Future<void> fetchUsername() async {
    username.value = await _authService.fetchUsername();
  }
}
