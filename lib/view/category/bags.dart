import 'package:flutter/material.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';


class Bags extends StatelessWidget {
  const Bags({super.key});

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
                      Text("Bags",
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
                                            Text("4.5",style: TextStyle(fontSize:getFontSize(15) ,color: Colors.white,fontWeight: FontWeight.bold),),]),
                                      width: getHorizontalSize(200),
                                      height: getVerticalSize(120),
                                      decoration: BoxDecoration(
                                        image:DecorationImage(image: AssetImage("images/photo3.jpg"),fit: BoxFit.fill,),
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            width:getHorizontalSize(0) ),
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
                                            fontSize:getFontSize(14) ,
                                          ),
                                        ),
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
                                    Text("Mini Black Bag",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize: getFontSize(15)),),
                                    Text("70 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize:getFontSize(15) ),),
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
                                            Text("5.0",style: TextStyle(fontSize: getFontSize(15),color: Colors.white,fontWeight: FontWeight.bold),),]),
                                      width: getHorizontalSize(200),
                                      height:getVerticalSize(120) ,
                                      decoration: BoxDecoration(
                                        image:DecorationImage(image: AssetImage("images/pinkbag.jpg"),fit: BoxFit.fill,),
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
                                    Text("Pink Bag",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize:getFontSize(15) ),),
                                    Text("150 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize: getFontSize(15)),),
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
                    Padding(padding: getPadding(left: 2),
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
                                                Text("4.3",style: TextStyle(fontSize:getFontSize(15) ,color: Colors.white,fontWeight: FontWeight.bold),),]),
                                          width: getHorizontalSize(200),
                                          height: getVerticalSize(120),
                                          decoration: BoxDecoration(
                                            image:DecorationImage(image: AssetImage("images/redbag.jpg"),fit: BoxFit.fill,),
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
                                        Text("Red Bag",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize: getFontSize(15)),),
                                        Text("170 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize:getFontSize(15) ),),
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
