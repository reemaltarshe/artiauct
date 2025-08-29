import 'package:flutter/material.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';
import 'package:handmade/controllers/auth_controller.dart';
import 'package:handmade/view/new_password/new_password.dart';

class Verification extends StatefulWidget {
  final String email;

  const Verification({super.key, required this.email});

  @override
  State<Verification> createState() => _MyVery();
}

class _MyVery extends State<Verification> {
  final AuthController authController = Get.put(AuthController());
  
  // أربعة Controllers لكل خانة
  final List<TextEditingController> controllers =
  List.generate(4, (_) => TextEditingController());

  // دالة لجمع القيم
  String getOtp() {
    return controllers.map((c) => c.text).join();
  }

  Future<void> verifyOTP() async {
    String otp = getOtp();
    print('OTP: $otp'); // طباعة الكود

    final success = await authController.verifyOTP(widget.email, otp);
    if (success) {
      authController.showSuccess('تم التحقق بنجاح');
      Get.to(NewPassword());
    } else {
      authController.showError(authController.errorMessage.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF3E3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_sharp),
                        color: Colors.black,
                        iconSize: getSize(30),
                      ),
                      SizedBox(width: getHorizontalSize(5)),
                      Text(
                        "Verification",
                        style: TextStyle(
                          color: Color(0xff5D5E59),
                          fontSize: getFontSize(22),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: getVerticalSize(50)),
            Text(
              "Enter Verification Code",
              style: TextStyle(
                color: Color(0xff5D5E59),
                fontSize: getFontSize(18),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: getVerticalSize(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      controller: controllers[index],
                      onChanged: (val) {
                        // الانتقال تلقائيًا للحقل التالي
                        if (val.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                        // إذا اكتمل الإدخال أرسل تلقائيًا
                        if (getOtp().length == 4) {
                          verifyOTP();
                        }
                      },
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                );
              }),
            ),
            Padding(
              padding: getPadding(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you don't receive a code.",
                    style: TextStyle(
                      color: Color(0xffA5A5A4),
                      fontSize: getFontSize(15),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        color: Color(0xffFFA45D),
                        fontSize: getFontSize(15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // كود إعادة الإرسال هنا
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: getPadding(top: 45),
              child: Container(
                height: getVerticalSize(45),
                width: getHorizontalSize(210),
                decoration: BoxDecoration(
                  color: Color(0xffFFCDAC),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: MaterialButton(
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      fontSize: getFontSize(16),
                      color: Color(0xff5D5E59),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    await verifyOTP();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}