import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:handmade/core/units/size_utils.dart';
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
  bool _isObscure = true;
  bool _isLoading = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<String?> loginAndGetToken(String username, String password) async {
    final url = Uri.parse('http://192.168.100.104:8000/token-auth/');
    try {
      final response = await http
          .post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'username': username, 'password': password}))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['token'];
      } else {
        print('فشل تسجيل الدخول: ${response.body}');
        return null;
      }
    } catch (e) {
      print('خطأ في الاتصال بالسيرفر: $e');
      return null;
    }
  }

  void handleLogin() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('تنبيه', 'يرجى إدخال اسم المستخدم وكلمة المرور',
          backgroundColor: Colors.orangeAccent, colorText: Colors.white);
      return;
    }

    setState(() => _isLoading = true);

    final token = await loginAndGetToken(username, password);

    setState(() => _isLoading = false);

    if (token != null) {
      Get.to(() => const MainScreen());
    } else {
      Get.snackbar('خطأ', 'فشل تسجيل الدخول. تحقق من البيانات المدخلة.',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
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
              child: TextField(
                controller: _usernameController,
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
              ),
            ),
            Padding(
              padding: getPadding(left: 30, right: 30, top: 30),
              child: TextField(
                controller: _passwordController,
                obscureText: _isObscure,
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
                        _isObscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() => _isObscure = !_isObscure);
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff5D5E59))),
                ),
              ),
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
                child: _isLoading
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}