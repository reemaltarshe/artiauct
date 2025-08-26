import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:handmade/view/home/home.dart';
import 'package:handmade/view/login/login.dart';
import 'package:handmade/view/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../new_password/verification.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _MySign();
}
class _MySign extends State<SignUp> {
  bool _isObscure = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 🚀 دالة التسجيل
  Future<void> registerUser() async {
    final url = Uri.parse('http://192.168.100.104:8000/register/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': usernameController.text,
        'first_name': firstNameController.text,
        'phone_number': phoneController.text,
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 201) {
      final enteredemail=emailController.text;
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ ${data['message']}')),
      );
      Get.to(Verification(email:enteredemail));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ ${response.body}')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFF3E3),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "images/signup.png",
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: getPadding(top: 50, left: 20),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color(0xff5D5E59),
                          fontSize: getFontSize(38),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: getPadding(left: 20, top: 10),
                      child: Container(
                        child: IconButton(
                          onPressed: () => {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                          ),
                          iconSize: 30,
                        ),
                        width: getHorizontalSize(90),
                        height: getVerticalSize(90),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF5D5E59))),
                      )),
                  Container(
                    width: getHorizontalSize(15),
                  ),
                  Padding(
                      padding: getPadding(top: 15),
                      child: SizedBox(
                          width: getHorizontalSize(265),
                          child: TextField(
                            controller: firstNameController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 4),
                                focusedBorder: OutlineInputBorder(),
                                border: OutlineInputBorder(),
                                hintText: "Enter your name",
                                hintStyle: TextStyle(
                                  color: Color(0xff979797),
                                  fontSize: getFontSize(16),
                                ),
                                fillColor: Color(0xffFFFFFF),
                                filled: true,
                                prefixIcon: Container(
                                    padding: getPadding(right: 5),
                                    margin: getMargin(right: 10, top: 12, bottom: 12, left: 15),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Color(0xff5D5E59),
                                                width:getHorizontalSize(2)))),
                                    child: Icon(Icons.person_2_outlined,
                                        size: getSize(20))),
                                prefixIconColor: Color(0xff5D5E59),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    BorderSide(color: Color(0xff5D5E59)))),
                          ))),
                ],
              ),
              SizedBox(height: getVerticalSize(30),),
              Padding(
                  padding: getPadding(left: 20, right: 20),
                  child: TextField(
                    controller: usernameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: "Enter your username",
                        hintStyle: TextStyle(
                          color: Color(0xFFB7B7B7),
                          fontSize: getFontSize(16),
                        ),
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                        prefixIcon: Container(
                            padding: getPadding(right: 5),
                            margin:getMargin(right: 10, top: 15, bottom: 15, left: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width:getHorizontalSize(2)))),
                            child: Icon(Icons.person_2_outlined, size:getSize(23))),
                        prefixIconColor: Color(0xff5D5E59),
                        contentPadding: getPadding(all:17),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                            )),
                  )),
              Padding(
                  padding: getPadding(left: 20, right: 20, top: 30),
                  child: TextField(
                    controller:  passwordController,
                    textInputAction: TextInputAction.next,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        hintText: "Enter your Password",
                        hintStyle: TextStyle(
                          color: Color(0xFFB7B7B7),
                          fontSize: getFontSize(16),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;});
                          },
                        ),
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                        prefixIcon: Container(
                            padding: getPadding(right: 5),
                            margin: getMargin(
                                right: 10, top: 15, bottom: 15, left: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: getHorizontalSize(2)))),
                            child: Icon(Icons.key_outlined, size:getSize(23))),
                        prefixIconColor: Color(0xff5D5E59),
                        contentPadding: getPadding(all:17),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                            )),
                  )),
              Padding(
                  padding: getPadding(left: 20, right: 20, top: 30),
                  child: TextField(
                    controller: emailController ,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          color: Color(0xFFB7B7B7),
                          fontSize: getFontSize(16),
                        ),
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                        prefixIcon: Container(
                            padding: getPadding(right:5),
                            margin: getMargin(right: 10, top: 15, bottom: 15, left: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(width: getHorizontalSize(2)))),
                            child: Icon(Icons.email_outlined, size:getSize(23))),
                        prefixIconColor: Color(0xff5D5E59),
                        contentPadding: getPadding(all:17),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                        )),
                  )),
              Padding(
                  padding: getPadding(left: 20, right: 20, top: 30),
                  child: TextField(
                    controller: phoneController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        hintText: "Enter your phone",
                        hintStyle: TextStyle(
                          color: Color(0xFFB7B7B7),
                          fontSize: getFontSize(16),
                        ),
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                        prefixIcon: Container(
                            padding: getPadding(right:5),
                            margin: getMargin(right: 10, top: 15, bottom: 15, left: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(width: getHorizontalSize(2)))),
                            child: Icon(Icons.phone_outlined, size:getSize(23))),
                        prefixIconColor: Color(0xff5D5E59),
                        contentPadding: getPadding(all:17),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  )),
              Padding(
                  padding:getPadding(top: 10,right: 210),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an count? ",
                        style: TextStyle(color: Color(0xffA5A5A4), fontSize:getFontSize(15) ),
                      ),
                      InkWell(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color(0xffFFA45D),
                              fontSize: getFontSize(15),
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () => {Get.to(Login())},
                      )
                    ],
                  )),
              SizedBox(height:getVerticalSize(40),),
              Padding(
                  padding: getPadding(left: 25, right: 25),
                  child: Container(
                      height: getVerticalSize(45),
                      width: getHorizontalSize(210),
                      decoration: BoxDecoration(
                          color: Color(0xffFFCDAC),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: MaterialButton(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: getFontSize(16), color: Color(0xff5D5E59)),
                          ), onPressed: () {/*Get.to(MainScreen());*/registerUser();})))
            ],
          ),
        ));
  }
}
