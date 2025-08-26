import 'package:flutter/material.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});
  @override
  State<Wishlist> createState() => _MyWishlist();
}
class _MyWishlist extends State<Wishlist> {
  int _selectedIndex=0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFFFFF3E3),
          body:SingleChildScrollView(
          child:
          Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: getHorizontalSize(150),),
    Container(
    margin: getMargin(top:30,bottom: 10,left: 10,right: 10),
    child:
                    Text("WishList",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize:getFontSize(22),color: Color(0XFF5D5E59),
                          fontWeight: FontWeight.bold),),),
                    SizedBox(width: getHorizontalSize(42),),
        Container(
          margin: getMargin(top:33,bottom: 10,right: 10),
          child:
                    TextButton(onPressed: (){},
                        child:
                        Text("5 Item(s)",
                          style: TextStyle(fontSize:getFontSize(18),fontWeight: FontWeight.w700,color: Color(0xFF5D5E59)),) ),),
                  ],
                ),
                SizedBox(height: getVerticalSize(20),),
                Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              child:
                              Column(
                                  children: [
                                    Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                            child:
                                            Container(
                                              padding: getPadding(bottom: 94,left: 5),
                                              child:
                                              Row(
                                                  children: [
                                                    Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20),),
                                                    Text("4.8",style: TextStyle(fontSize:getFontSize(15),color: Colors.white,fontWeight: FontWeight.bold),),]),
                                              width: getHorizontalSize(189),
                                              height: getVerticalSize(120),
                                              decoration: BoxDecoration(
                                                image:DecorationImage(image: AssetImage("images/photo10.jpg"),fit: BoxFit.fill,),
                                              ),
                                            ),
                                          ),
                                        ]
                                    ),
                                    Container(
                                      width: getHorizontalSize(190),
                                      height: getVerticalSize(90),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                            width: getHorizontalSize(1)),
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                      ),
                                      child:
                                      Column(
                                        children: [
                                          SizedBox(height:getVerticalSize(5),),
                                          Text("Coffee Candle",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize:getFontSize(15)),),
                                          Text("90 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize: getFontSize(15)),),
                                          SizedBox(height: getVerticalSize(10),),
                                          Row(
                                              children: [
                                                Container(
                                                  child: Image.asset("images/User name.jpg",fit: BoxFit.fill,),
                                                  margin: getMargin(left: 5,),
                                                  width: getHorizontalSize(30),
                                                  height: getVerticalSize(30),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        style: BorderStyle.solid,
                                                        width: getHorizontalSize(1)),
                                                  ),
                                                ),
                                                SizedBox(width:getHorizontalSize(2),),
                                                InkWell(
                                                  onTap: () {},
                                                  child:
                                                  Text("username",
                                                    style: TextStyle(
                                                      color: Color(0xFF5D5E59),
                                                      fontSize:getFontSize(11),
                                                      fontWeight: FontWeight.bold,),),
                                                ),
                                              ])
                                        ],),
                                    )
                                  ]),
                            ),
                            InkWell(
                              onTap: () {},
                              child:
                              Column(
                                  children: [
                                    Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                            child:
                                            Container(
                                              padding: getPadding(bottom: 94,left: 5),
                                              child:
                                              Row(
                                                  children: [
                                                    Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20),),
                                                    SizedBox(width:getHorizontalSize(3),),
                                                    Text("5.5",style: TextStyle(fontSize:getFontSize(15),color: Colors.white,fontWeight: FontWeight.bold),),]),
                                              width:getHorizontalSize(189),
                                              height:getVerticalSize(120),
                                              decoration: BoxDecoration(
                                                image:DecorationImage(image: AssetImage("images/photo9.jpg"),fit: BoxFit.fill,),

                                              ),
                                            ),
                                          ),
                                        ]
                                    ),
                                    Container(
                                      width: getHorizontalSize(190),
                                      height: getVerticalSize(90),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                            width: getHorizontalSize(1)),
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                      ),
                                      child: Column(
                                          children: [
                                            SizedBox(height: getVerticalSize(5),),
                                            Text("Wool Jaclet",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize:getFontSize(15)),),
                                            Text("200 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize: getFontSize(15)),),
                                            SizedBox(height: getVerticalSize(10),),
                                            Row(
                                                children: [
                                                  Container(
                                                    child: Image.asset("images/User name.jpg",fit: BoxFit.fill,),
                                                    margin:getMargin(left: 5,),
                                                    width: getHorizontalSize(30),
                                                    height:getVerticalSize(30),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          style: BorderStyle.solid,
                                                          width:getHorizontalSize(1)),
                                                    ),
                                                  ),
                                                  SizedBox(width:getHorizontalSize(2),),
                                                  InkWell(
                                                    onTap: () {},
                                                    child:
                                                    Text("username",
                                                      style: TextStyle(
                                                        color: Color(0xFF5D5E59),
                                                        fontSize:getFontSize(11),
                                                        fontWeight: FontWeight.bold,),),
                                                  ),
                                                ])
                                          ]),
                                    )
                                  ]),
                            ),
                          ]),
                      SizedBox(height: getVerticalSize(20),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              child:
                              Column(
                                  children: [
                                    Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                            child:
                                            Container(
                                              padding: getPadding(bottom: 94,left: 5),
                                              child:
                                              Row(
                                                  children: [
                                                    Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20),),
                                                    SizedBox(width: getHorizontalSize(3),),
                                                    Text("4.5",
                                                      style: TextStyle(
                                                          fontSize: getFontSize(15),
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold),),]),
                                              width:getHorizontalSize(189),
                                              height:getVerticalSize(120),
                                              decoration: BoxDecoration(
                                                image:DecorationImage(image: AssetImage("images/photo4.jpg"),fit: BoxFit.fill,),
                                              ),
                                            ),
                                          ),
                                        ]
                                    ),
                                    Container(
                                      width: getHorizontalSize(190),
                                      height: getVerticalSize(90),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                            width: getHorizontalSize(1)),
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                      ),
                                      child:
                                      Column(
                                        children: [
                                          SizedBox(height: getVerticalSize(5),),
                                          Text("Strawberry Cake",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize: getFontSize(15)),),
                                          Text("100 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize:getFontSize(15)),),
                                          SizedBox(height: getHorizontalSize(10),),
                                          Row(
                                              children: [
                                                Container(
                                                  child: Image.asset("images/User name.jpg",fit: BoxFit.fill,),
                                                  margin:getMargin(left: 5,),
                                                  width: getHorizontalSize(30),
                                                  height:getVerticalSize(30),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        style: BorderStyle.solid,
                                                        width:getHorizontalSize(1)),
                                                  ),
                                                ),
                                                SizedBox(width:getHorizontalSize(2),),
                                                InkWell(
                                                  onTap: () {},
                                                  child:
                                                  Text("username",
                                                    style: TextStyle(color: Color(0xFF5D5E59),
                                                      fontSize:getFontSize(11),
                                                      fontWeight: FontWeight.bold,),),
                                                ),
                                              ])
                                        ],),
                                    )
                                  ]),
                            ),
                            InkWell(
                              onTap: () {},
                              child:
                              Column(
                                  children: [
                                    Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                            child:
                                            Container(
                                              padding: getPadding(bottom: 94,left: 5),
                                              child:
                                              Row(
                                                  children: [
                                                    Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20),),
                                                    SizedBox(width:getHorizontalSize(3),),
                                                    Text("4.5",style: TextStyle(fontSize:getFontSize(15),color: Colors.white,fontWeight: FontWeight.bold),),]),
                                              width: getHorizontalSize(189),
                                              height: getVerticalSize(120),
                                              decoration: BoxDecoration(
                                                image:DecorationImage(image: AssetImage("images/photo3.jpg"),fit: BoxFit.fill,),
                                              ),
                                            ),
                                          ),
                                        ]
                                    ),
                                    Container(
                                      width: getHorizontalSize(190),
                                      height: getVerticalSize(90),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                            width:getHorizontalSize(1)),
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                      ),
                                      child:
                                      Column(
                                          children: [
                                            SizedBox(height: getVerticalSize(5),),
                                            Text("Mini Black Bag",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize: getFontSize(15)),),
                                            Text("70 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize:getFontSize(15)),),
                                            SizedBox(height:getVerticalSize(10),),
                                            Row(
                                                children: [
                                                  Container(
                                                    child: Image.asset("images/User name.jpg",fit: BoxFit.fill,),
                                                    margin: EdgeInsets.only(left: 5,),
                                                    width:getHorizontalSize(30),
                                                    height: getVerticalSize(30),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          style: BorderStyle.solid,
                                                          width: getHorizontalSize(1)),
                                                    ),
                                                  ),
                                                  SizedBox(width:getHorizontalSize(2),),
                                                  InkWell(
                                                    onTap: () {},
                                                    child:
                                                    Text("username",
                                                      style: TextStyle(color: Color(0xFF5D5E59),
                                                        fontSize: getFontSize(11),
                                                        fontWeight: FontWeight.bold,),),
                                                  ),
                                                ])
                                          ]),
                                    )
                                  ]),
                            ),
                          ]),
                      SizedBox(height:getVerticalSize(20),),
                      InkWell(
                          onTap: () {},
                          child:
                          Container(
                            margin: getMargin(left: 10),
                            child:
                            Row(

                                children: [
                                  Column(
                                      children: [
                                        Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                                child:
                                                Container(
                                                  padding: getPadding(bottom: 94,left: 5),
                                                  child:
                                                  Row(
                                                      children: [
                                                        Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20),),
                                                        SizedBox(width:getHorizontalSize(3),),
                                                        Text("4.0",style: TextStyle(fontSize: getFontSize(15),color: Colors.white,fontWeight: FontWeight.bold),),]),
                                                  width: getHorizontalSize(189),
                                                  height:getVerticalSize(120),
                                                  decoration: BoxDecoration(
                                                    image:DecorationImage(image: AssetImage("images/photo5.jpg"),fit: BoxFit.fill,),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                        Container(
                                          width:getHorizontalSize(190),
                                          height: getVerticalSize(90),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.white,
                                                style: BorderStyle.solid,
                                                width:getHorizontalSize(1)),
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                          ),
                                          child: Column(
                                              children: [
                                                SizedBox(height:getVerticalSize(5),),
                                                Text("Wool Sweater",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize:getFontSize(15)),),
                                                Text("80 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize:getFontSize(15)),),
                                                SizedBox(height:getVerticalSize(10),),
                                                Row(
                                                    children: [
                                                      Container(
                                                        child: Image.asset("images/User name.jpg",fit: BoxFit.fill,),
                                                        margin: getMargin(left: 5,),
                                                        width: getHorizontalSize(30),
                                                        height: getVerticalSize(30),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                              color: Colors.white,
                                                              style: BorderStyle.solid,
                                                              width: getHorizontalSize(1)),
                                                        ),
                                                      ),
                                                      SizedBox(width:getHorizontalSize(2),),
                                                      InkWell(
                                                        onTap: () {},
                                                        child:
                                                        Text("username",
                                                          style: TextStyle(color: Color(0xFF5D5E59),
                                                            fontSize:getFontSize(11),
                                                            fontWeight: FontWeight.bold,),),
                                                      ),
                                                    ]),
                                              ]),
                                        ),
                                      ]),
                                ]),
                          )
                      ),
                    ]),
              ])
      ),),
    );
  }
}
