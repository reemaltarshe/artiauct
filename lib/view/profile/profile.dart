
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:handmade/data/models/username.dart';
import 'package:get/get.dart';
import 'package:handmade/view/auction_announcement/auction_announcement.dart';
import 'package:handmade/view/edit/edit.dart';


class Profile extends StatefulWidget {
  final String username ;
  const Profile({Key? key, required this.username}) : super(key: key);
  @override
  State<Profile> createState() => _MyProfile();
}

class _MyProfile extends State<Profile> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                  children: [
              Image.asset(
                "images/edit.png",
                fit: BoxFit.cover,
              ),
              Positioned(top: 110, left: 20, child: Padding(
                  padding: getPadding(left: 128),
                  child:
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("images/username.jpg"),
                    backgroundColor: Colors.transparent,
                  )),),
                Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.logout_outlined,),iconSize:getSize(30),
                  onPressed: ( ) {
                  },
                ),
              ),
              Container(
                  margin: getMargin(left: 135,top: 215),
                  child: Text(
                    "User Name",
                    style: TextStyle(color: Color(0xff5D5E59), fontSize: getFontSize(30)),
                  )),]),
              SizedBox(
                height:getVerticalSize(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () => {},
                      child: Container(
                        width: getHorizontalSize(96),
                        height: getVerticalSize(33),
                        decoration: BoxDecoration(
                            color: Color(0xffFFCDAC),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Color(0xffFFCDAC))),
                        child: Padding(
                            padding:getPadding(top: 5),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Post",
                              style:
                              TextStyle(color:Colors.black, fontSize: getFontSize(14),fontWeight: FontWeight.w400),
                            )),
                      )),
                  SizedBox(
                    width: getHorizontalSize(30),
                  ),
                  InkWell(
                      onTap: () => {},
                      child: Container(
                        width: getHorizontalSize(96),
                        height: getVerticalSize(33),
                        decoration: BoxDecoration(
                            color: Color(0xffFFF3E3),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Color(0xffFFF3E3))),
                        child: Padding(
                            padding: getPadding(top: 5),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Request",
                              style:
                              TextStyle(color:Colors.black, fontSize: getFontSize(14),fontWeight: FontWeight.w400),
                            )),
                      )),
                  SizedBox(
                    width: getHorizontalSize(30),
                  ),
                  InkWell(
                      onTap: () => {
                        Get.to(Edit())},
                      child: Container(
                        width: getHorizontalSize(96),
                        height: getVerticalSize(33),
                        decoration: BoxDecoration(
                            color: Color(0xffFFF3E3),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Color(0xffFFF3E3))),
                        child: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Edit",
                              style:
                              TextStyle(color:Colors.black, fontSize: getFontSize(14),fontWeight: FontWeight.w400),
                            )),
                      ))
                ],
              ),
              Padding(
                  padding:getPadding(top: 20, left: 25),
                  child: Text(
                    "My Works",
                    style: TextStyle(color: Color(0xffFFA45D), fontSize:getFontSize(20)),
                  )),
Padding(padding: getPadding(top: 20,left: 15),
    child:
              InkWell(
                onTap: () {
                  Get.to(AuctionAnnouncement());
                },
                child: Column(
                  children: [
                    Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                            child:
                            Container(
                              padding: getPadding(bottom: 170,left: 8),
                              child:
                              Row(
                                  children: [
                                    Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20) ,),
                                    SizedBox(width:getHorizontalSize(3) ,),
                                    Text("4.8",style: TextStyle(fontSize:getFontSize(15) ,color: Colors.white,fontWeight: FontWeight.bold),),
                                  ]),
                              width: getHorizontalSize(380),
                              height: getVerticalSize(200),
                              decoration: BoxDecoration(
                                image:DecorationImage(image: AssetImage("images/christmas.jpg"),fit: BoxFit.fill,),
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    width: getHorizontalSize(0)),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            left: 323,
                            child: Transform.rotate(
                              angle: 0.7854,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 12),
                                color: Colors.blue,
                                child: Text(
                                  'Auction',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: getFontSize(14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                    Container(
                      width: getHorizontalSize(380),
                      height:getVerticalSize(90) ,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.white,
                            width:getHorizontalSize(1) ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: Offset(2, -5),
                          )
                        ],
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                      ),
                      child: Column(
                          children: [
                            SizedBox(height: getVerticalSize(10),),
                            Text("Christmas Candle",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize: getFontSize(20)),),
                            Text("50 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize: getFontSize(16)),),
                          ]),
                    ),
                  ],
                ),),
),
              Padding(padding: getPadding(top: 15,left: 15,bottom: 15),
                child:
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                              child:
                              Container(
                                padding: getPadding(bottom: 170,left: 8),
                                child:
                                Row(
                                    children: [
                                      Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20) ,),
                                      SizedBox(width:getHorizontalSize(3) ,),
                                      Text("4.5",style: TextStyle(fontSize:getFontSize(15) ,color: Colors.white,fontWeight: FontWeight.bold),),
                                    ]),
                                width: getHorizontalSize(380),
                                height: getVerticalSize(200),
                                decoration: BoxDecoration(
                                  image:DecorationImage(image: AssetImage("images/photo4.jpg"),fit: BoxFit.fill,),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      width: getHorizontalSize(0)),
                                ),
                              ),
                            ),
                          ]),
                      Container(
                        width: getHorizontalSize(380),
                        height:getVerticalSize(90) ,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.white,
                              width:getHorizontalSize(1) ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 15,
                              offset: Offset(2, -5),
                            )
                          ],
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                        ),
                        child: Column(
                            children: [
                              SizedBox(height: getVerticalSize(10),),
                              Text("Strawberry Cake",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize: getFontSize(20)),),
                              Text("100 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize: getFontSize(16)),),
                            ]),
                      ),
                    ],
                  ),),
              ),
            ],
          )),
    );
  }
}
