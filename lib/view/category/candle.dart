import 'package:flutter/material.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';


class Candles extends StatelessWidget {
  const Candles({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFF3E3),
        body: SingleChildScrollView(
          child:
          Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: getMargin(top: 30,left: 10),
                      alignment: Alignment.topLeft,
                      child:
                      IconButton(onPressed: (){
                        Get.back();
                      },
                          icon: Icon(Icons.arrow_back_sharp),
                          color: Colors.black,
                          iconSize:getSize (30)),
                    ),
                    SizedBox(width:getHorizontalSize(110) ,),
                    Container(
                      margin: getMargin(top: 30,left: 10),
                      child:
                      Text("Candles",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: getFontSize(22),color: Color(0xFF5D5E59),
                            fontWeight: FontWeight.bold),),),

                  ],
                ),
                SizedBox(height:getVerticalSize(40) ,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                                      child:
                                      Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20) ,),
                                            SizedBox(width:getHorizontalSize(3) ,),
                                            Text("4.8",style: TextStyle(fontSize:getFontSize(15) ,color: Colors.white,fontWeight: FontWeight.bold),),
                                          ]),
                                      width: getHorizontalSize(200),
                                      height: getVerticalSize(120),
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
                                    left: 145,
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
                              width: getHorizontalSize(200),
                              height:getVerticalSize(90) ,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width:getHorizontalSize(1) ),
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                              ),
                              child: Column(
                                  children: [
                                    SizedBox(height: getVerticalSize(5),),
                                    Text("Christmas Candle",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize: getFontSize(15)),),
                                    Text("50 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize: getFontSize(15)),),
                                    SizedBox(height: getVerticalSize(10),),
                                    Row(
                                        children: [
                                          Container(
                                            child: Image.asset("images/username.jpg",fit: BoxFit.fill,),
                                            margin: getMargin(left: 5,),
                                            width: getHorizontalSize(30),
                                            height: getVerticalSize(30),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  style: BorderStyle.solid,
                                                  width:getHorizontalSize(1) ),
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
                                          ) ]),
                                  ]),
                            ),
                          ],
                        ),),
                      SizedBox(width:getHorizontalSize(5) ,),
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
                                        child:
                                        Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20) ,),
                                              SizedBox(width:getHorizontalSize(3) ,),
                                              Text("2.0",style: TextStyle(fontSize: getFontSize(15),color: Colors.white,fontWeight: FontWeight.bold),),]),
                                        width: getHorizontalSize(200),
                                        height:getVerticalSize(120) ,
                                        decoration: BoxDecoration(
                                          image:DecorationImage(image: AssetImage("images/luminouscandle.jpg"),fit: BoxFit.fill,),
                                          border: Border.all(
                                              style: BorderStyle.solid,
                                              width:getHorizontalSize(0) ),
                                        ),
                                      ),
                                    ),
                                  ]),
                              Container(
                                width: getHorizontalSize(200),
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
                                      SizedBox(height:getVerticalSize(5) ,),
                                      Text("Luminous Candle",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize:getFontSize(15) ),),
                                      Text("40 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize: getFontSize(15)),),
                                      SizedBox(height:getVerticalSize(10) ,),
                                      Row(
                                          children: [
                                            Container(
                                              child: Image.asset("images/username.jpg",fit: BoxFit.fill,),
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
                                            SizedBox(width:getHorizontalSize(2) ,),
                                            InkWell(
                                              onTap: () {},
                                              child:
                                              Text("username",
                                                style: TextStyle(color: Color(0xFF5D5E59),
                                                  fontSize: getFontSize(11),
                                                  fontWeight: FontWeight.bold,),),
                                            )]),
                                    ]),
                              ),
                            ]),),
                    ]
                ),
                SizedBox(height:getVerticalSize(20),),
                Padding(padding: getPadding(left: 1),
                  child:
                  Row(
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
                                          child:
                                          Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20) ,),
                                                SizedBox(width: getHorizontalSize(3),),
                                                Text("1.3",style: TextStyle(fontSize:getFontSize(15) ,color: Colors.white,fontWeight: FontWeight.bold),),]),
                                          width: getHorizontalSize(200),
                                          height: getVerticalSize(120),
                                          decoration: BoxDecoration(
                                            image:DecorationImage(image: AssetImage("images/vanillacandle.jpg"),fit: BoxFit.fill,),
                                            border: Border.all(
                                                style: BorderStyle.solid,
                                                width:getHorizontalSize(0) ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                Container(
                                  width:getHorizontalSize(200) ,
                                  height: getVerticalSize(90),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width:getHorizontalSize(1) ),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                  ),
                                  child: Column(
                                      children: [
                                        SizedBox(height:getVerticalSize(5) ,),
                                        Text("Vanilla Candle",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize: getFontSize(15)),),
                                        Text("79 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize:getFontSize(15) ),),
                                        SizedBox(height:getVerticalSize(10) ,),
                                        Row(
                                            children: [
                                              Container(
                                                child: Image.asset("images/username.jpg",fit: BoxFit.fill,),
                                                margin: getMargin(left: 5,),
                                                width:getHorizontalSize(30) ,
                                                height:getVerticalSize(30) ,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      style: BorderStyle.solid,
                                                      width: getHorizontalSize(1)),
                                                ),
                                              ),
                                              SizedBox(width:getHorizontalSize(2) ,),
                                              InkWell(
                                                onTap: () {},
                                                child:
                                                Text("username",
                                                  style: TextStyle(color: Color(0xFF5D5E59),
                                                    fontSize: getFontSize(11),
                                                    fontWeight: FontWeight.bold,),),
                                              ) ]),
                                      ]),
                                ),
                              ]),),
                        SizedBox(width: getHorizontalSize(7),),
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
                                          child:
                                          Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20) ,),
                                                SizedBox(width: getHorizontalSize(3),),
                                                Text("1.7",style: TextStyle(fontSize:getFontSize(15) ,color: Colors.white,fontWeight: FontWeight.bold),),]),
                                          width: getHorizontalSize(200),
                                          height: getVerticalSize(120),
                                          decoration: BoxDecoration(
                                            image:DecorationImage(image: AssetImage("images/photo10.jpg"),fit: BoxFit.fill,),
                                            border: Border.all(
                                                style: BorderStyle.solid,
                                                width:getHorizontalSize(0) ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                Container(
                                  width:getHorizontalSize(200) ,
                                  height: getVerticalSize(90),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width:getHorizontalSize(1) ),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                  ),
                                  child: Column(
                                      children: [
                                        SizedBox(height:getVerticalSize(5) ,),
                                        Text("Coffee Candle",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize: getFontSize(15)),),
                                        Text("90 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize:getFontSize(15) ),),
                                        SizedBox(height:getVerticalSize(10) ,),
                                        Row(
                                            children: [
                                              Container(
                                                child: Image.asset("images/username.jpg",fit: BoxFit.fill,),
                                                margin: getMargin(left: 5,),
                                                width:getHorizontalSize(30) ,
                                                height:getVerticalSize(30) ,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      style: BorderStyle.solid,
                                                      width: getHorizontalSize(1)),
                                                ),
                                              ),
                                              SizedBox(width:getHorizontalSize(2) ,),
                                              InkWell(
                                                onTap: () {},
                                                child:
                                                Text("username",
                                                  style: TextStyle(color: Color(0xFF5D5E59),
                                                    fontSize: getFontSize(11),
                                                    fontWeight: FontWeight.bold,),),
                                              ) ]),
                                      ]),
                                ),
                              ]),),
                      ]
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
