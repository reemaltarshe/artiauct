import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';
import 'package:handmade/controllers/auth_controller.dart';



class Edit extends StatefulWidget {
  const Edit({super.key});
  @override
  State<Edit> createState() => _MyEdit();
}
class _MyEdit extends State<Edit> {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFF3E3),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: getPadding(left: 20, top: 40),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back),
                        color: Color(0xff5D5E59),
                        iconSize:getSize(30) ,
                      ),
                      SizedBox(
                        width: getHorizontalSize(90),
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: Color(0xff5D5E59),
                            fontSize: getFontSize(22),
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )),
              Row(
                children: [
                  Padding(
                      padding: getPadding(left: 30, top: 30),
                      child: SizedBox(
                          width: getHorizontalSize(90),
                          height: getVerticalSize(90),
                          child: Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.expand,
                              children: [
                                DottedBorder(
                                    dashPattern: [16, 8],
                                    borderType: BorderType.Circle,
                                    strokeWidth: 2,
                                    color: Color(0xffFFA45D),
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundImage:
                                      AssetImage("images/username.jpg"),
                                      backgroundColor: Colors.transparent,
                                    )),
                                Positioned(
                                    bottom: -18,
                                    right: 1,
                                    child: RawMaterialButton(
                                      onPressed: () {},
                                      elevation: 2.0,
                                      fillColor: Color(0xffFFA45D),
                                      child: Icon(Icons.camera_alt_outlined, color: Color(0xffFFFFFF),size: 22,),
                                      padding: getPadding(all: 10),
                                      shape: CircleBorder(),
                                    )),
                              ]))),
                  Container(
                    width: getHorizontalSize(15),
                  ),
                  Padding(
                      padding: getPadding(top: 30),
                      child: SizedBox(
                          width: getHorizontalSize(255),
                          child: Obx(() => TextField(
                            controller: nameController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 4),
                                hintText: "verachahem",
                                hintStyle: TextStyle(
                                  color: Color(0xffB7B7B7),
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
                                                width:getHorizontalSize(2) ))),
                                    child: Icon(Icons.person_2_outlined,size:getSize(20) ,)),
                                prefixIconColor: Color(0xff5D5E59),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),)),
                          ))),
                ],
              ),
              Padding(
                  padding: getPadding(top: 40),
                  child: Text(
                    "Share a little bit about yourself!",
                    style: TextStyle(color: Color(0xff5D5E59), fontSize:getFontSize(18)),
                  )),
              SizedBox(
                height: getVerticalSize(30),
              ),
              Padding(
                  padding:getPadding(left: 20, right: 20),
                  child: Obx(() => TextField(
                    controller: bioController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: "Tell us about yourself",
                        hintStyle: TextStyle(
                          color: Color(0xffB7B7B7),
                          fontSize: getFontSize(16),
                        ),
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                        prefixIcon: Container(
                            padding: getPadding(right: 5),
                            margin: getMargin(right: 10, top: 15, bottom: 15, left: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(width:getHorizontalSize(2)))),
                            child: Icon(Icons.person_2_outlined,size: getSize(23),)),
                        prefixIconColor: Color(0xff5D5E59),
                        contentPadding: getPadding(all: 17),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),)),
                  ))),
              Padding(
                  padding: getPadding(left: 20, right: 20, top: 30),
                  child: Obx(() => TextField(
                    controller: passwordController,
                    textInputAction: TextInputAction.next,
                    obscureText: !authController.isPasswordVisible.value,
                    decoration: InputDecoration(
                        hintText: "*********",
                        hintStyle: TextStyle(
                          color: Color(0xffB7B7B7),
                          fontSize: getFontSize(16),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(authController.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            authController.togglePasswordVisibility();
                          },
                        ),
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                        prefixIcon: Container(
                            padding: getPadding(right: 5),
                            margin: getMargin(right: 10, top: 15, bottom: 15, left: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                         width:getHorizontalSize(2)))),
                            child: Icon(Icons.key_outlined,size:getSize(23),)),
                        prefixIconColor: Color(0xff5D5E59),
                        contentPadding: getPadding(all: 17),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),)),
                  )),
              Padding(
                  padding: getPadding(left: 20, right: 20, top: 30),
                  child: Obx(() => TextField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          color: Color(0xffB7B7B7),
                          fontSize: getFontSize(16),
                        ),
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                        prefixIcon: Container(
                            padding: getPadding(right: 5),
                            margin: getMargin(right: 10, top: 15, bottom: 15, left: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(width:getHorizontalSize(2)))),
                            child: Icon(Icons.email_outlined,size: getSize(23),)),
                        prefixIconColor: Color(0xff5D5E59),
                        contentPadding: EdgeInsets.all(17),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),)),
                  )),
              Padding(
                  padding: getPadding(left: 20, right: 20, top: 30),
                  child: Obx(() => TextField(
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
              Container(
                height: getVerticalSize(45),
              ),
              Padding(
                  padding: getPadding(left: 25, right: 25),
                  child: Container(
                      height: getVerticalSize(45),
                      width: getHorizontalSize(210),
                      decoration: BoxDecoration(
                          color: Color(0xffFFCDAC),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Obx(() => MaterialButton(
                          child: Text(
                            'Update',
                            style: TextStyle(
                                fontSize: getFontSize(16), color: Color(0xff5D5E59),fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            // Here you would typically call the API to update the profile
                            authController.showSuccess('Profile updated successfully!');
                          })))
            ],
          ),
        ));
  }
}
