import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:handmade/controllers/auth_controller.dart';
import 'package:handmade/view/main_screen/main_screen.dart';
import 'package:handmade/view/new_password/verification.dart';

void main() {
  runApp(const MaterialApp(home: Login()));
}

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthController authController = Get.put(AuthController());

  void handleLogin() async {
    final success = await authController.login();
    if (!success) {
      authController.showError(authController.errorMessage.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF3E3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset("images/signup.png", fit: BoxFit.cover),
                Padding(
                  padding: getPadding(top: 50, left: 20),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: const Color(0xff5D5E59),
                        fontSize: getFontSize(38),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(height: getVerticalSize(100)),
            Padding(
              padding: getPadding(left: 30, right: 30),
              child: Obx(() => TextField(
                controller: authController.usernameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Enter your username",
                  hintStyle: TextStyle(
                      color: const Color(0xffB7B7B7),
                      fontSize: getFontSize(16)),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person_outline, color: Color(0xff5D5E59)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff5D5E59))),
                ),
              )),
            ),
            Padding(
              padding: getPadding(left: 30, right: 30, top: 30),
              child: Obx(() => TextField(
                controller: authController.passwordController,
                obscureText: !authController.isPasswordVisible.value,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                      color: const Color(0xffB7B7B7),
                      fontSize: getFontSize(16)),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock_outline, color: Color(0xff5D5E59)),
                  suffixIcon: IconButton(
                    icon: Icon(
                        authController.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      authController.togglePasswordVisibility();
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff5D5E59))),
                ),
              )),
            ),
            Padding(
              padding: getPadding(left: 40, top: 11),
              child: InkWell(
                onTap: (){},
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                      fontSize: getFontSize(14), color: Color(0xff5D5E59)),
                ),
              ),
            ),
            Padding(
              padding: getPadding(top: 45, left: 100),
              child: Container(
                height: getVerticalSize(45),
                width: getHorizontalSize(210),
                decoration: BoxDecoration(
                    color: const Color(0xffFFCDAC),
                    borderRadius: BorderRadius.circular(12)),
                child: Obx(() => authController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : MaterialButton(
                  onPressed: handleLogin,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: getFontSize(17),
                        color: const Color(0xff5D5E59),
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}