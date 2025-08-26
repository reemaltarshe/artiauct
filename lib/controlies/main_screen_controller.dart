//
//
//
import 'package:handmade/view/home/home.dart';
import 'package:handmade/view/messages/messages.dart';
import 'package:handmade/view/wishlist/wishlist.dart';
import 'package:handmade/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {

  int currentIndex = 0;

  Widget currentPage() {
    if (currentIndex == 0) {
      return Home();
    }
    if (currentIndex == 1) {
      return Wishlist();
    }
    if (currentIndex == 2) {
      return Profile(username: "",);
    }
    if (currentIndex == 3) {
      return Messages();
    }
    return Home();
  }

  void updateIndex(int index) {
    currentIndex = index;
    update();
  }

}
