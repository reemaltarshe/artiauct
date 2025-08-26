import 'package:flutter/material.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';



class NNotification extends StatelessWidget {
  const NNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFF3E3),
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: getPadding(left: 10, top: 40),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Color(0xff5D5E59),
                          iconSize: 30,
                        ),
                        SizedBox(
                          width: getHorizontalSize(100),
                        ),
                        Text(
                          "Notification",
                          style: TextStyle(
                              color: Color(0xff5D5E59),
                              fontSize: getFontSize(22),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                Padding(
                    padding: getPadding(left: 20, top: 40),
                    child: Row(
                      children: [
                        Text(
                          "Today",
                          style: TextStyle(color: Color(0xff5D5E59), fontSize: getFontSize(17)),
                        ),
                        SizedBox(
                          width: getHorizontalSize(250),
                        ),
                        InkWell(
                            child: Text(
                              "Clear all",
                              style: TextStyle(color: Color(0xff5D5E59), fontSize: getFontSize(17)),
                            )),
                      ],
                    )),
                Container(
                    margin: getMargin(top: 10),
                    height: getVerticalSize(110),
                    width: getHorizontalSize(380),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC0C1BA),
                              offset: Offset(4, 4),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                        color: Color(0xffFFFAF3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Color(0xffFFFAF3))),
                    child: Row(
                      children: [
                        Container(
                            child: Icon(
                              Icons.notifications_outlined,
                              color: Color(0xffFFA45D),
                              size: 25,
                            ),
                            margin: getMargin(left: 10),
                            width: getHorizontalSize(50),
                            height: getVerticalSize(50),
                            decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.all(Radius.circular(60)),
                                border: Border.all(color: Color(0xffFFA45D)))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: getPadding(top: 15, left: 5),
                                child: Text(
                                  "You Win!",
                                  style: TextStyle(
                                      color: Color(0xffFFA45D), fontSize:getFontSize(16)),
                                )),
                            Padding(
                                padding:getPadding(top: 7, left: 16),
                                child: Text("Product Name:",
                                    style: TextStyle(
                                        color: Color(0xff5D5E59), fontSize:getFontSize(10) ))),
                            Padding(
                                padding: getPadding(left: 16),
                                child: Text("Person Name:",
                                    style: TextStyle(
                                        color: Color(0xff5D5E59), fontSize:getFontSize(10) ))),
                            Padding(
                                padding: getPadding(right:27),
                                child: Text("Price:",
                                    style: TextStyle(
                                        color: Color(0xff5D5E59), fontSize:getFontSize(10)))),

                          ],

                        ),

                        SizedBox(
                          width:getHorizontalSize(190),
                        ),
                        Padding(
                            padding: getPadding(bottom: 55),
                            child: Text("Now",
                                style: TextStyle(
                                    color: Color(0xff5D5E59), fontSize:getFontSize(12)))),
                      ],
                    )),
                SizedBox(
                  width: getHorizontalSize(30),
                ),
                Container(
                    margin: getMargin(top: 30),
                    height: getVerticalSize(110),
                    width: getHorizontalSize(380),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC0C1BA),
                              offset: Offset(4, 4),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                        color: Color(0xffFFFAF3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Color(0xffFFFAF3))),
                    child: Row(
                      children: [
                        Container(
                            child: Icon(
                              Icons.notifications_outlined,
                              color: Color(0xffFFA45D),
                              size: 25,
                            ),
                            margin: getMargin(left: 10),
                            width: getHorizontalSize(50),
                            height: getVerticalSize(50),
                            decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.all(Radius.circular(60)),
                                border: Border.all(color: Color(0xffFFA45D)))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: getPadding(top: 12, left: 10),
                                child: Text(
                                  "The Auction Price has \n Changed",
                                  style: TextStyle(
                                      color: Color(0xffFFA45D), fontSize: 14),
                                )),
                            Padding(
                                padding: getPadding(top: 2, right: 60),
                                child: Text("Product Name:",
                                    style: TextStyle(
                                        color: Color(0xff5D5E59), fontSize: getFontSize(10)))),
                            Padding(
                                padding: getPadding(right: 65),
                                child: Text("Person Name:",
                                    style: TextStyle(
                                        color: Color(0xff5D5E59), fontSize: getFontSize(10)))),
                            Padding(
                                padding: getPadding(right:106),
                                child: Text("Price:",
                                    style: TextStyle(
                                        color: Color(0xff5D5E59), fontSize:getFontSize(10) ))),
                          ],
                        ),
                        SizedBox(
                          width: getHorizontalSize(90),
                        ),
                        Padding(
                            padding: getPadding(bottom: 55),
                            child: Text("4 min ago",
                                style: TextStyle(
                                    color: Color(0xff5D5E59), fontSize: getFontSize(12)))),
                      ],
                    )),
                Padding(
                    padding: getPadding(left: 20, top: 40),
                    child: Row(
                      children: [
                        Text(
                          "Yesterday",
                          style: TextStyle(color: Color(0xff5D5E59), fontSize:getFontSize(17) ),
                        ),
                        SizedBox(
                          width: getHorizontalSize(245),
                        ),
                        InkWell(
                            child: Text(
                              "Clear",
                              style: TextStyle(color: Color(0xff5D5E59), fontSize:getFontSize(17)),
                            )),
                      ],
                    )),
                Container(
                    margin: getMargin(top: 10),
                    height: getVerticalSize(110),
                    width: getHorizontalSize(380),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC0C1BA),
                              offset: Offset(4, 4),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                        color: Color(0xffFFFAF3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Color(0xffFFFAF3))),
                    child: Row(children: [
                      Container(
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Color(0xffFFA45D),
                            size: 25,
                          ),
                          margin: getMargin(left: 10),
                          width: getHorizontalSize(50),
                          height: getVerticalSize(50),
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.all(Radius.circular(60)),
                              border: Border.all(color: Color(0xffFFA45D)))),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: getPadding(top: 20,right: 30),
                                child: Text(
                                  "You Lose",
                                  style: TextStyle(
                                      color: Color(0xffFFA45D), fontSize: getFontSize(16)),
                                )),
                            Padding(
                                padding: getPadding(top: 3, left: 16),
                                child: Text("Try your luck in another \n auction.",
                                    style: TextStyle(
                                        color: Color(0xff5D5E59), fontSize:getFontSize(10) ))),]),
                      SizedBox(
                        width: getHorizontalSize(140),
                      ),
                      Padding(
                          padding: getPadding(bottom: 55),
                          child: Text("10:15",
                              style: TextStyle(
                                  color: Color(0xff5D5E59), fontSize: getFontSize(12)))),
                    ])),

              ],
            )));
  }
}
