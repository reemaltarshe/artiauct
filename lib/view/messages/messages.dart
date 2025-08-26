import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:handmade/core/units/size_utils.dart';



class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MyMessages();
}
class _MyMessages extends State<Messages> {
  String _searchTerm = '';
  final int unreadMessages = 1;
  void _onSearchTextChanged(String text) {
    setState(() {
      _searchTerm = text;
    });
    print('Searching for: $_searchTerm');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor:Color(0xFFFFF3E3),
          body:SingleChildScrollView(child:
          Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: getMargin(left: 10,top: 30,bottom: 10),
                      alignment: Alignment.topLeft,
                      child:
                      IconButton(onPressed: (){},
                          icon: Icon(Icons.arrow_back_sharp),
                          color: Colors.black,
                          iconSize:getSize(30) ),
                    ),
                    Padding(padding: getPadding(top: 22),child:  Text(" Reem",
                      style: TextStyle(fontSize: getFontSize(25),
                          fontWeight: FontWeight.bold),),),
                  ],
                ),
                Row(
                    children: [
                      Flexible(child:
                      Padding(
                        padding: getPadding(left: 25,right: 25),
                        child: TextField(
                          style: TextStyle(height:getVerticalSize(1) ),
                          onChanged: _onSearchTextChanged,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Color(0xFFb7b7b7),fontSize:getFontSize(16)),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xFFb7b7b7),
                              size:getSize(25),),
                            contentPadding: getPadding(all: 15),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xFFb7b7b7),width: getHorizontalSize(1)),
                            ),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide:BorderSide(color: Color(0xFFb7b7b7),),
                            ),
                          ),
                        ),
                      ),
                      ),
                    ]),
                SizedBox(height:getVerticalSize(30),),
                Padding(padding: getPadding(right: 240),child: Text("Messages",style: TextStyle(fontSize: getFontSize(25),fontWeight: FontWeight.bold),),),
                SizedBox(height:getVerticalSize(30),),
               InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage("images/reeem.jpg"),
                              ),
                              SizedBox(width: getHorizontalSize(13)),
                              Flexible(
                                  child: Column(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(padding: getPadding(right: 120,),child:  Text.rich(TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:'Reemo \n',
                                                style: TextStyle(fontSize: getFontSize(16),fontWeight: FontWeight.bold),
                                              ),
                                              TextSpan(
                                                  text: 'Hi i need an order' ,
                                                  style: TextStyle(color: Color(0xFFb7b7b7),fontSize: getFontSize(15))
                                              )
                                            ]
                                        )
                                        ),
                                        ),
                                        SizedBox(height: getVerticalSize(10),),

                                      ])),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //if (unreadMessages > 0)
                                  Text("12:34",style: TextStyle(fontSize:getFontSize(13),),),
                                  Container(
                                    margin: getMargin(right: 5),
                                    padding:getPadding(top: 6,left: 6,right: 6,bottom: 9),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFFFA45D), // Customize color
                                    ),
                                    child: Text(
                                      unreadMessages.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:getFontSize(10),
                                          fontWeight: FontWeight.bold // optional
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ])
                    )
                ),
                //SizedBox(height: getVerticalSize(1),),
                Divider(
                  indent: 100,
                  color: Color(0xFFFFA45D),
                  thickness: 1,
                  height: getVerticalSize(10),
                  endIndent: 1,
                ),
                SizedBox(height:getVerticalSize(10),),
                InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage("images/nagham.jpg"),
                              ),
                              SizedBox(width:getHorizontalSize(13)),
                              Flexible(
                                  child: Column(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(padding: getPadding(top: 2,right: 120,),child:  Text.rich(TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:'Nagham \n',
                                                style: TextStyle(fontSize:getFontSize(16),fontWeight: FontWeight.bold),
                                              ),
                                              TextSpan(
                                                  text: 'Hi i need an order' ,
                                                  style: TextStyle(color: Color(0xFFb7b7b7),fontSize:getFontSize(15))
                                              )
                                            ]
                                        )
                                        ),
                                        ),
                                        SizedBox(height: getVerticalSize(10),),
                                      ])),
                              Column(
                               // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //if (unreadMessages > 0)
                                  SizedBox(width: 22,),
                                  Text("12:34",style: TextStyle(fontSize:getFontSize(13),),),
                                  Container(
                                    margin: getMargin(right: 5),                                    padding: getPadding(top: 6,left: 6,right: 6,bottom: 6),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFFFA45D), // Customize color
                                    ),
                                    child: Text(
                                      unreadMessages.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:getFontSize(10),
                                          fontWeight: FontWeight.bold // optional
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ])
                    )
                ),
                Divider(
                  indent: 100,
                  color: Color(0xFFFFA45D),
                  thickness: 1,
                  height:getVerticalSize(10),
                  endIndent: 1,
                ),
                SizedBox(height: getVerticalSize(10),),
                InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage("images/vera.jpg"),
                              ),
                              SizedBox(width:getHorizontalSize(13)),
                              Flexible(
                                  child: Column(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(padding: getPadding(top: 2,right: 120,),child:  Text.rich(TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:'Vera \n',
                                                style: TextStyle(fontSize:getFontSize(16),fontWeight: FontWeight.bold),
                                              ),
                                              TextSpan(
                                                  text: 'Hi i need an order' ,
                                                  style: TextStyle(color: Color(0xFFb7b7b7),fontSize:getFontSize(15))
                                              )
                                            ]
                                        )
                                        ),
                                        ),
                                        SizedBox(height:getVerticalSize(10) ,),

                                      ])),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //if (unreadMessages > 0)
                                  Text("12:34",style: TextStyle(fontSize:getFontSize(13),),),
                                  Container(
                                    margin: getMargin(right: 5),                                    padding: getPadding(top: 6,left: 6,right: 6,bottom: 6),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFFFA45D), // Customize color
                                    ),
                                    child: Text(
                                      unreadMessages.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: getFontSize(10),
                                          fontWeight: FontWeight.bold // optional
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ])
                    )
                ),
                SizedBox(height: getVerticalSize(1),),
                Divider(
                  indent: 100,
                  color: Color(0xFFFFA45D),
                  thickness: 1,
                  height: getVerticalSize(10),
                  endIndent: 1,
                ),
                SizedBox(height: getVerticalSize(10),),
                InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage("images/alaa.jpg"),
                              ),
                              SizedBox(width: 16),
                              Flexible(
                                  child: Column(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(padding:getPadding(top: 2,right: 150,),child:  Text.rich(TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:'Alaa \n',
                                                style: TextStyle(fontSize: getFontSize(16),fontWeight: FontWeight.bold),
                                              ),
                                              TextSpan(
                                                  text: 'Hi i need an order' ,
                                                  style: TextStyle(color: Color(0xFFb7b7b7),fontSize:getFontSize(15))
                                              )
                                            ]
                                        )
                                        ),
                                        ),
                                        SizedBox(height:getVerticalSize(10) ,),

                                      ])),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (unreadMessages > 1)
                                    Container(
                                      padding: getPadding(top: 6,left: 6,right: 6,bottom: 6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFFA45D), // Customize color
                                      ),
                                      child: Text(
                                        unreadMessages.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: getFontSize(10),
                                            fontWeight: FontWeight.bold // optional
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ])
                    )
                ),
                Divider(
                  indent: 100,
                  color: Color(0xFFFFA45D),
                  thickness: 1,
                  height: getVerticalSize(10),
                  endIndent: 1,
                ),
              ])
          )


      ),
    );
  }
}
