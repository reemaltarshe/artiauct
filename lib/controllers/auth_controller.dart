import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/core/services/api_service.dart';
import 'package:handmade/data/models/user_model.dart';
import 'package:handmade/view/main_screen/main_screen.dart';
import 'package:handmade/view/new_password/verification.dart';

class AuthController extends GetxController {
  final ApiService _apiService = ApiService();
  
  // Observable variables
  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  final RxString errorMessage = ''.obs;

  // Form controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Form validation
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  // Check if user is already logged in
  Future<void> checkLoginStatus() async {
    try {
      final token = await _apiService.getToken();
      if (token != null) {
        final userData = await _apiService.getUserData();
        if (userData != null) {
          currentUser.value = UserModel.fromJson(userData);
          isLoggedIn.value = true;
        }
      }
    } catch (e) {
      print('Error checking login status: $e');
    }
  }

  // Login method
  Future<bool> login() async {
    if (!_validateLoginForm()) return false;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.login(
        usernameController.text.trim(),
        passwordController.text.trim(),
      );

      if (response['token'] != null) {
        currentUser.value = UserModel.fromJson(response['user'] ?? {});
        isLoggedIn.value = true;
        
        // Clear form
        usernameController.clear();
        passwordController.clear();
        
        Get.offAll(() => const MainScreen());
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Login failed';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Register method
  Future<bool> register() async {
    if (!_validateRegisterForm()) return false;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final userData = {
        'username': usernameController.text.trim(),
        'first_name': firstNameController.text.trim(),
        'last_name': lastNameController.text.trim(),
        'email': emailController.text.trim(),
        'phone_number': phoneController.text.trim(),
        'password': passwordController.text.trim(),
      };

      final response = await _apiService.register(userData);

      if (response['message'] != null) {
        // Navigate to verification page
        Get.to(() => Verification(email: emailController.text.trim()));
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Registration failed';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Verify OTP method
  Future<bool> verifyOTP(String email, String otpCode) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.verifyOTP(email, otpCode);

      if (response['success'] == true) {
        errorMessage.value = '';
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Verification failed';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Reset password method
  Future<bool> resetPassword(String email) async {
    if (!_isValidEmail(email)) {
      errorMessage.value = 'Please enter a valid email address';
      return false;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.resetPassword(email);

      if (response['success'] == true) {
        errorMessage.value = '';
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Password reset failed';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Change password method
  Future<bool> changePassword(String oldPassword, String newPassword) async {
    if (!_validatePasswordChange(oldPassword, newPassword)) return false;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.changePassword(oldPassword, newPassword);

      if (response['success'] == true) {
        errorMessage.value = '';
        return true;
      } else {
        errorMessage.value = response['message'] ?? 'Password change failed';
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Logout method
  Future<void> logout() async {
    try {
      await _apiService.clearStoredData();
      currentUser.value = null;
      isLoggedIn.value = false;
      
      // Clear all form controllers
      clearAllControllers();
      
      Get.offAllNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  // Clear all form controllers
  void clearAllControllers() {
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Validation methods
  bool _validateLoginForm() {
    if (usernameController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter your username';
      return false;
    }
    if (passwordController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter your password';
      return false;
    }
    return true;
  }

  bool _validateRegisterForm() {
    if (usernameController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter a username';
      return false;
    }
    if (firstNameController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter your first name';
      return false;
    }
    if (emailController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter your email';
      return false;
    }
    if (!_isValidEmail(emailController.text.trim())) {
      errorMessage.value = 'Please enter a valid email address';
      return false;
    }
    if (phoneController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter your phone number';
      return false;
    }
    if (passwordController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter a password';
      return false;
    }
    if (passwordController.text.length < 8) {
      errorMessage.value = 'Password must be at least 8 characters long';
      return false;
    }
    if (confirmPasswordController.text.trim().isEmpty) {
      errorMessage.value = 'Please confirm your password';
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      errorMessage.value = 'Passwords do not match';
      return false;
    }
    return true;
  }

  bool _validatePasswordChange(String oldPassword, String newPassword) {
    if (oldPassword.isEmpty) {
      errorMessage.value = 'Please enter your current password';
      return false;
    }
    if (newPassword.isEmpty) {
      errorMessage.value = 'Please enter a new password';
      return false;
    }
    if (newPassword.length < 8) {
      errorMessage.value = 'New password must be at least 8 characters long';
      return false;
    }
    return true;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // Get current user
  UserModel? get user => currentUser.value;

  // Check if user is authenticated
  bool get isAuthenticated => isLoggedIn.value && currentUser.value != null;

  // Show error snackbar
  void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  // Show success snackbar
  void showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
} 