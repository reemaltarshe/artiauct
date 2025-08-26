
import 'package:handmade/core/units/pref_helper.dart';
import 'package:handmade/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:handmade/view/add_post_auction/add_post_auction.dart';
import 'package:handmade/view/add_post_sale/add_post_sale.dart';
import 'package:handmade/view/auction_announcement/auction_announcement.dart';
import 'package:handmade/view/category/bags.dart';
import 'package:handmade/view/category/candle.dart';
import 'package:handmade/view/category/category.dart';
import 'package:handmade/view/choose_post/choose_post.dart';
import 'package:handmade/view/detail_sale/detail_sale.dart';
import 'package:handmade/view/edit/edit.dart';
import 'package:handmade/view/home/home.dart';
import 'package:handmade/view/login/login.dart';
import 'package:handmade/view/main_screen/main_screen.dart';
import 'package:handmade/view/messages/chatting.dart';
import 'package:handmade/view/messages/message_widget.dart';
import 'package:handmade/view/messages/messages.dart';
import 'package:handmade/view/new_password/new_password.dart';
import 'package:handmade/view/new_password/verification.dart';
import 'package:handmade/view/notification/notification.dart';
import 'package:handmade/view/profile/profile.dart';
import 'package:handmade/view/signup/signup.dart';
import 'package:handmade/view/wishlist/wishlist.dart';
import 'package:handmade/view/filter/filter.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //PrefHelper prefHelper = PrefHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      //initialRoute: AppRoutes.m,
      getPages: AppRoutes.pages,
      home:SignUp()
    );
  }
}

