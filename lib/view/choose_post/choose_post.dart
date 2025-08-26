import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';
import 'package:handmade/view/add_post_auction/add_post_auction.dart';
import 'package:handmade/view/add_post_sale/add_post_sale.dart';
void main() {
  runApp(ChoosePost());
}

class ChoosePost extends StatelessWidget {
  const ChoosePost({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          backgroundColor:Color(0xFFFFF3E3),
          body:Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 40,horizontal: 10),
                      alignment: Alignment.topLeft,
                      child:
                      IconButton(onPressed: (){
                        Get.back();

                      },
                          icon: Icon(Icons.arrow_back_sharp),
                          color: Colors.black,
                          iconSize: getFontSize(30)),
                    ),
                    SizedBox(width: getHorizontalSize(78),),
                    Text("Choose Post",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize:getFontSize(22) ,
                          fontWeight: FontWeight.bold,color: Color(0xFF5D5E59)),),
                  ],
                ),
                SizedBox(height: getVerticalSize(200),),
                MaterialButton(onPressed:(){
                  Get.to(() =>  AddPostAuction()) ;
                },child: Text("Auction Announcement",style: TextStyle(fontSize: getFontSize(16),color: Color(0xFF5D5E59)),),color:Color(0XFFFFCDAC),minWidth: getHorizontalSize(300),height:getVerticalSize(50) ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
                SizedBox(height: getVerticalSize(30)),
                MaterialButton(onPressed: (){
                  Get.to(() =>  AddPostSale()) ;
                },child: Text("Direct Sale",style: TextStyle(fontSize:getFontSize(16),color: Color(0xFF5D5E59)),),color: Color(0XFFFFCDAC),minWidth:getHorizontalSize(300) ,height: getVerticalSize(50),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),)
              ]
          ),
        )

    );
  }
}


