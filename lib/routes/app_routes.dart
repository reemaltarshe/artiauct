import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:handmade/view/home/home.dart';
import 'package:handmade/view/auction_announcement/auction_announcement.dart';
import 'package:handmade/view/add_post_sale/add_post_sale.dart';
import 'package:handmade/view/choose_post/choose_post.dart';
import 'package:handmade/view/detail_sale/detail_sale.dart';
import 'package:handmade/view/login/login.dart';
import 'package:handmade/view/messages/chatting.dart';
import 'package:handmade/view/messages/messages.dart';
import 'package:handmade/view/category/category.dart';
import 'package:handmade/view/add_post_auction/add_post_auction.dart';
import 'package:handmade/view/notification/notification.dart';
import 'package:handmade/view/wishlist/wishlist.dart';
import 'package:handmade/view/edit/edit.dart';
import 'package:handmade/view/profile/profile.dart';
import 'package:handmade/view/signup/signup.dart';
import 'package:handmade/view/new_password/new_password.dart';
import 'package:handmade/view/new_password/verification.dart';
import 'package:handmade/view/messages/message_widget.dart';
import 'package:handmade/view/messages/chat_model.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:handmade/view/new_password/new_password.dart';


class AppRoutes {

  static const String auction_announcement = "/auction_announcement" ;

  static const String home = "/home" ;

  static const String add_post_auction = "/add_post_auction" ;

  static const String add_post_sale = "/add_post_sale" ;

  static const String choose_post = "/choose_post" ;

  static const String detail_sale = "/detail_sale" ;

  static const String messages = "/messages" ;

  static const String category = "/category" ;

  static const String wishlist = "/wishlist" ;

  static const String edit = "/edit" ;

  static const String login = "/login" ;

  static const String notification = "/notification" ;

  static const String profile = "/profile" ;

  static const String signup = "/signup" ;

  static const String chatting = "/chatting" ;

  static const String message_widget = "/message_widget" ;

  static const String new_password = "/new_password" ;

  static const String verification = "/verification" ;








  static List<GetPage<dynamic>> pages = [

    GetPage(name: choose_post, page: () => const ChoosePost()),

    GetPage(name: add_post_auction, page: () => const AddPostAuction()),

    GetPage(name: add_post_sale, page: () => const AddPostSale()),

    GetPage(name: auction_announcement, page: () => const AuctionAnnouncement()),

    GetPage(name: category, page: () => const Category()),

    GetPage(name: detail_sale, page: () => const DetailSale()),

    GetPage(name: home, page: () => const Home()),

    GetPage(name: messages, page: () => const Messages()),

    GetPage(name: wishlist, page: () => const Wishlist()),

    GetPage(name: edit, page: () => const Edit()),

    GetPage(name: login, page: () => const Login()),

    GetPage(name: notification, page:() => const NNotification()),

    //GetPage(name: profile, page: () => const Profile()),

    GetPage(name: signup, page: () => const SignUp()),

    GetPage(name: new_password, page: () => const NewPassword()),

   // GetPage(name: verification, page: () => const Verification(email: emailentered,)),

   /* GetPage(name: message_widget, page: () => const Bubblemessage(message: Get.arguments as Message,)),*/

    GetPage(name: chatting, page: () => const Chatting()),






  ];

}