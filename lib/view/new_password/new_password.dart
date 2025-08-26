import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';
import 'package:handmade/view/main_screen/main_screen.dart';



class NewPassword extends StatefulWidget {
  const NewPassword({super.key});
  @override
  State<NewPassword> createState() => _MyNew();
}
class _MyNew extends State<NewPassword> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF3E3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "images/signup.png",
                  fit: BoxFit.cover,
                ),
                Padding(
                    padding: getPadding(top: 33, left: 6),
                    child: Row(
                        children: [
                        IconButton(onPressed: (){
                          Get.back();
                },
                    icon: Icon(Icons.arrow_back_sharp),
                    color: Colors.black,
                    iconSize:getSize(30) ),
                      SizedBox(
                        width: getHorizontalSize(5),
                      ),
                      Text(
                        "New Password",
                        style: TextStyle(
                            color: Color(0xff5D5E59),
                            fontSize: getFontSize(22),
                            fontWeight: FontWeight.bold),
                      )
                    ])),
              ],
            ),
            SizedBox(
              height: getVerticalSize(50),
            ),
            Padding(
                padding: getPadding(left: 25),
                child: Text(
                  "Enter New Password: ",
                  style:
                  TextStyle(color: const Color(0xff5D5E59), fontSize: getFontSize(18),fontWeight: FontWeight.bold),
                )),
            Padding(
                padding: getPadding(top: 5, left: 20, right: 20),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                      contentPadding: getPadding(all: 17),
                      hintText: "At least 8 digits",
                      hintStyle: TextStyle(
                        color: Color(0xffB7B7B7),
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
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff5D5E59)))),
                )),
            Padding(
                padding: getPadding(top: 25, left: 25),
                child: Text(
                  "Confirm Password: ",
                  style:
                  TextStyle(color: const Color(0xff5D5E59), fontSize: getFontSize(18),fontWeight: FontWeight.bold),
                )),
            Padding(
                padding: getPadding(top: 5, left: 20, right: 20),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                      contentPadding: getPadding(all: 17),
                      hintText: "**********",
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
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff5D5E59)))),
                )),
            Padding(
                padding: getPadding(top: 45, left: 95),
                child: Container(
                    height: getVerticalSize(45),
                    width: getHorizontalSize(210),
                    decoration: BoxDecoration(
                        color: Color(0xffFFCDAC),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: MaterialButton(
                        child: Text(
                          'Sumbit',
                          style:
                          TextStyle(fontSize:getFontSize(16), color: Color(0xff5D5E59),fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {Get.to(MainScreen());})))
          ],
        ),
      ),
    );
  }
}
