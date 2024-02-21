import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController
{
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    update();
  }
}