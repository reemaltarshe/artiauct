//
//
//
import 'package:handmade/view/choose_post/choose_post.dart';
import 'package:handmade/view/home/home.dart';
import 'package:handmade/view/wishlist/wishlist.dart';
import 'package:handmade/view/profile/profile.dart';
import 'package:handmade/controlies/main_screen_controller.dart';
import 'package:handmade/core/units//size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainScreen> {

  final MainScreenController controller = Get.put(MainScreenController());
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<MainScreenController>(
      builder: (controller) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,            floatingActionButton: Container(
              height: getVerticalSize(60),
              width:getHorizontalSize(60) ,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                shape: CircleBorder(),
                elevation: 9.0,
                onPressed: (){
                  Get.to(() =>  ChoosePost()) ;
                },
                child: Icon(Icons.add,color: Color(0xff5D5E59),),
              ),
            ),
          body: controller.currentPage() ,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (int index){
              setState(() {
              selectedIndex = index;
              });
              controller.updateIndex(index);
              },
        selectedLabelStyle: TextStyle(fontSize: getFontSize(15)),
        unselectedFontSize:getFontSize(15) ,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.black,
        elevation: 9,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items:[
        BottomNavigationBarItem(icon:Icon(Icons.home,size:getSize(25),),
        label: "Home",
        ),
        BottomNavigationBarItem(icon:Icon(Icons.favorite_border,size:getSize(30) ,),
        label: "Wishlist",
        ),
        BottomNavigationBarItem(
        icon:Icon(Icons.person_outlined,size:getSize(30),),
        label: "Profile",
        ),
          BottomNavigationBarItem(
        icon:Icon(Icons.chat_outlined,size:getSize(30),),
        label: "Chatting",
          )
        ]
        ),
        ) ;
      },
    ));
  }
}
