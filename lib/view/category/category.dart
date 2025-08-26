import 'package:flutter/material.dart';
import 'package:handmade/core/units/size_utils.dart';

void main() {
  runApp(Category());
}

class Category extends StatelessWidget {
  const Category({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFFFFF3E3),
            body: Column(
                children: [
                  Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 40,horizontal: 10),
                          alignment: Alignment.topLeft,
                          child:
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.arrow_back_sharp),
                              color: Colors.black,
                              iconSize: getSize(30)),),
                        SizedBox(width: getHorizontalSize(90),),
                        Text("Caregories",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: getFontSize(22),
                              color: Color(0xFF5D5E59),
                              fontWeight: FontWeight.bold),),
                      ]
                  ),
                  SizedBox(height: getVerticalSize(60)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                            children: [
                              Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:
                                      Container(
                                        width:getHorizontalSize(115) ,
                                        height: getVerticalSize(100),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("images/Accessoire.jpg",),fit: BoxFit.cover),
                                          border: Border.all(
                                              color: Colors.black,
                                              style: BorderStyle.solid,
                                              width: getHorizontalSize(1)),),
                                      ),),]),
                              SizedBox(height: getVerticalSize(10),),
                              Text("Accessories",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize:getFontSize(15) ,
                                    color: Colors.black),),
                            ]
                        ),
                        Column(
                            children: [
                              Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:
                                      Container(
                                        width:getHorizontalSize(115) ,
                                        height: getVerticalSize(100),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("images/candle.jpg",),fit: BoxFit.cover),
                                          border: Border.all(
                                              color: Colors.black,
                                              style: BorderStyle.solid,
                                              width: getHorizontalSize(1)),),
                                      ),),]),
                              SizedBox(height:getVerticalSize(10) ,),
                              Text("Candle",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(15),
                                    color: Colors.black),),
                            ]
                        ),
                        Column(
                            children: [
                              Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:
                                      Container(
                                        width:getHorizontalSize(115) ,
                                        height: getVerticalSize(100),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("images/painting.jpg",),fit: BoxFit.cover),
                                          border: Border.all(
                                              color: Colors.black,
                                              style: BorderStyle.solid,
                                              width: getHorizontalSize(1)),),
                                      ),),]),
                              SizedBox(height: getVerticalSize(10),),
                              Text("Painting",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(15),
                                    color: Colors.black),),
                            ]
                        ),
                      ]
                  ),
                  SizedBox(height:getVerticalSize(15) ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                            children: [
                              Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:
                                      Container(
                                        width:getHorizontalSize(115) ,
                                        height: getVerticalSize(100),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("images/wool.jpg",),fit: BoxFit.cover),
                                          border: Border.all(
                                              color: Colors.black,
                                              style: BorderStyle.solid,
                                              width: getHorizontalSize(1)),),
                                      ),),]),
                              SizedBox(height: getVerticalSize(10),),
                              Text("Wool",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize:getFontSize(15) ,
                                  color: Colors.black,),),
                            ]
                        ),
                        Column(
                            children: [
                              Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:
                                      Container(
                                        width:getHorizontalSize(115) ,
                                        height: getVerticalSize(100),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("images/sweet.jpg",),fit: BoxFit.cover),
                                          border: Border.all(
                                              color: Colors.black,
                                              style: BorderStyle.solid,
                                              width: getHorizontalSize(1)),),
                                      ),),]),
                              SizedBox(height: getVerticalSize(10),),
                              Text("Sweet",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(15),
                                    color: Colors.black),),
                            ]
                        ),
                        Column(
                            children: [
                              Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:
                                      Container(
                                        width:getHorizontalSize(115) ,
                                        height: getVerticalSize(100),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("images/coop.jpg",),fit: BoxFit.cover),
                                          border: Border.all(
                                              color: Colors.black,
                                              style: BorderStyle.solid,
                                              width: getHorizontalSize(1)),),
                                      ),),]),
                              SizedBox(height: getVerticalSize(10),),
                              Text("Carving",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(15),
                                    color: Colors.black),),
                            ]
                        ),
                      ]
                  ),
                  SizedBox(height: getVerticalSize(15)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                            children: [
                              Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:
                                      Container(
                                        width:getHorizontalSize(115) ,
                                        height: getVerticalSize(100),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("images/decoration.jpg",),fit: BoxFit.cover),
                                          border: Border.all(
                                              color: Colors.black,
                                              style: BorderStyle.solid,
                                              width:getHorizontalSize(1) ),),
                                      ),),]),
                              SizedBox(height:getVerticalSize(10) ,),
                              Text("Decoration",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize:getFontSize(15) ,
                                    color: Colors.black),),
                            ]
                        ),
                        Column(
                            children: [
                              Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:
                                      Container(
                                        width:getHorizontalSize(115) ,
                                        height: getVerticalSize(100),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("images/bag.jpg",),fit: BoxFit.cover),
                                          border: Border.all(
                                              color: Colors.black,
                                              style: BorderStyle.solid,
                                              width: getHorizontalSize(1)),),
                                      ),),]),
                              SizedBox(height:getVerticalSize(10) ,),
                              Text("Bags",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(15),
                                    color: Colors.black),),
                            ]
                        ),
                        Column(
                            children: [
                              Container(
                                width:getHorizontalSize(115) ,
                                height: getVerticalSize(100),
                                decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width:getHorizontalSize(1) ),
                                  borderRadius:BorderRadius.circular(10),),
                              ),
                              SizedBox(height:getVerticalSize(10),),
                              Text("Other",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize:getFontSize(15) ,
                                    color: Colors.black),),
                            ]
                        ),
                      ]),
                ])
        )
    );
  }
}
