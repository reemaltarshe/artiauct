import 'package:flutter/material.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';
import 'package:handmade/view/comment/comment.dart';

class AuctionAnnouncement extends StatefulWidget {
  const AuctionAnnouncement({super.key});

  @override
  State<AuctionAnnouncement> createState() => _MyAuctionAnnouncement();
}
class _MyAuctionAnnouncement extends State<AuctionAnnouncement> {

  bool isFavorite = false;
  int wishlistItemCount = 0;

  double startPrice = 0;
  double currentPrice = 0;

  bool _isJoined = false;
  void increasePrice() {
  setState(() {
  currentPrice += (currentPrice * 0.1);
  });
  }
  @override
  void initState() {
  super.initState();
  startPrice = 6000;
  currentPrice = startPrice;
  }

  Widget build(BuildContext context) {
  return MaterialApp(

  home: Scaffold(
  body:
      SingleChildScrollView(
      child:
  Column(
  children: [
  Row(
  children: [
  Container(
    margin: getMargin(top: 40,left: 10),
    child:
      IconButton(onPressed: (){
        Get.back();
      },
        icon: Icon(Icons.arrow_back_sharp),
        color: Colors.black,
        iconSize:getSize(30) ),),
    SizedBox(width: getHorizontalSize(25),),
      Container(
        margin: getMargin(top: 40,left: 10),
        child:
          Text("Auction Announcement",
                textAlign: TextAlign.center,
                 style: TextStyle(fontSize: getFontSize(22),
                     fontWeight: FontWeight.bold),),),
    SizedBox(width: getHorizontalSize(23),),
      Container(
        margin: getMargin(top: 40,left: 10),
        child:
        IconButton(onPressed: (){
          setState(() {
            isFavorite = !isFavorite;
            if (isFavorite) {
              wishlistItemCount = 1;
            } else {
              wishlistItemCount = 0;
            }
          });
        },
                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey[700]),
                    iconSize:getSize(30) ),),
        ],
  ),
    Row(
      children: [
        Container(
          margin: getMargin(left: 40),
          child: Image.asset("images/username.jpg",),
          width: getHorizontalSize(50),
          height: getVerticalSize(50),
          decoration: BoxDecoration(shape: BoxShape.circle,
              border: Border.all(style: BorderStyle.solid,width:getHorizontalSize(2) )),
        ),
        SizedBox(width: getHorizontalSize(10),),
        Text("username",style: TextStyle(fontSize: getFontSize(18),fontWeight: FontWeight.bold),)
      ],
    ),
  SizedBox(height:getVerticalSize(10) ,),
                Stack(
                 children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Container(
                         width: getHorizontalSize(350),
                         height:getVerticalSize(240) ,
                         decoration: BoxDecoration(
                          image:DecorationImage(image: AssetImage("images/photo.jpg"),fit: BoxFit.fill,),
                          border: Border.all(
                          style: BorderStyle.solid,
                          width: getHorizontalSize(0)),),

                                           ),
                                      )
                            ]
                       ),
  Container(
         decoration: BoxDecoration(
         color: Colors.white,
         border: Border.all(
         color: Colors.white,
         style: BorderStyle.solid,
         width: getHorizontalSize(1)),
         borderRadius: BorderRadius.only(
         bottomLeft: Radius.circular(20),
         bottomRight: Radius.circular(20)),
       ),
  ),
  SizedBox(height:getVerticalSize(10),),
        Padding(
           padding: getPadding(right: 170),
              child:
                 Column(
                   children: [
                     Text("Christmas Candles",
                     style: TextStyle(color: Color(0xFF5D5E59),
                     fontWeight: FontWeight.bold,
                     fontSize:getFontSize(20)),),
                    Container(
                     margin:getMargin(right: 65),
                     child:
                      Text("with biscuits",
                      style: TextStyle(color: Color(0xFFB7B7B7),
                       fontSize:getFontSize(17),),),),
                    ]
               ),
            ),
    Divider(color: Color(0xFFFFA45D),
            height:getVerticalSize(30) ,
            thickness: 3,
            indent: 35,
            endIndent: 35,),
  Padding(
          padding: getPadding(right: 230),
          child:
             Container(
              child: Column(
               children: [
                Text("Description",
                style: TextStyle(color: Color(0xFFFFA45D),
                fontWeight: FontWeight.bold,
                 fontSize: getFontSize(20)),),
                ]
               ),
             ),
           ),
  Padding(padding: getPadding(right: 10),
           child:
            RichText(text:
            TextSpan(
            children:
           <TextSpan>[
           TextSpan(
           text: 'Merry Christmas ....We have made this candle \nwith full of love to celebrate in this special \noccasion ...',
          style: TextStyle(color: Color(0xFF5D5E59),fontSize:getFontSize(16) ),),
          TextSpan(text: 'Read More',style: TextStyle(color: Color(0xFFFFA45D),fontSize: getFontSize(16))),])
          )
      ),
  Padding(
        padding: getPadding(right: 290,top:10),
         child:
          Container(
             child: Column(
              children: [
               Text("Time",
                style: TextStyle(color: Color(0xFFFFA45D),
                fontWeight: FontWeight.bold,
                 fontSize: getFontSize(20)),),
                    ]
                  ),
             ),
        ),
  SizedBox(height:getVerticalSize(5) ),
  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
  Column(
       children: [
       Text("Days",
       style: TextStyle(fontSize:getFontSize(15) ,color: Color(0xFF5D5E59)),),
        SizedBox(height: getVerticalSize(5),),
  Container(
         width:getHorizontalSize(80) ,
         height: getVerticalSize(45),
         decoration: BoxDecoration(
         color: Color(0xFFFFF3E3),
         border: Border.all(
         color: Color(0xFFFFF3E3),
         style: BorderStyle.solid,
         width: getHorizontalSize(2)),
          borderRadius:BorderRadius.circular(10),),
         child:Center(
          child:
           Text("20",style: TextStyle(fontSize: getFontSize(18),fontWeight: FontWeight.bold,color: Colors.black),)
                   ),
         ),
      ]
  ),
  Column(
      children: [
           Text("Hours",
            style: TextStyle(fontSize:getFontSize(15) ,color: Color(0xFF5D5E59)),),
  SizedBox(height:getVerticalSize(5) ,),
  Container(
        width:getHorizontalSize(80) ,
        height:getVerticalSize(45) ,
        decoration: BoxDecoration(
        color: Color(0xFFFFF3E3),
       border: Border.all(
       color: Color(0xFFFFF3E3),
        style: BorderStyle.solid,
        width:getHorizontalSize(2) ),
       borderRadius:BorderRadius.circular(10),),
        child:Center(
   child:
       Text("22",style: TextStyle(fontSize:getFontSize(18) ,fontWeight: FontWeight.bold,color: Colors.black),)
            ),
      ),
     ]
  ),
  Column(
        children: [
           Text("Min",
           style: TextStyle(fontSize:getFontSize(15) ,color: Color(0xFF5D5E59)),),
  SizedBox(height:getVerticalSize(5) ,),
  Container(
         width:getHorizontalSize(80),
         height: getVerticalSize(45),
         decoration: BoxDecoration(
         color: Color(0xFFFFF3E3),
         border: Border.all(
         color: Color(0xFFFFF3E3),
         style: BorderStyle.solid,
         width:getHorizontalSize(2)),
         borderRadius:BorderRadius.circular(10),),
      child:Center(
       child:
            Text("22",style: TextStyle(fontSize:getFontSize(18),fontWeight: FontWeight.bold,color: Colors.black),)
          ),
       ),
      ]
    ),
   ]
  ),

  SizedBox(height:getVerticalSize(20),),
    ProductCommentsSection(),
  SizedBox(height: getVerticalSize(20),),
  Center(
    child: Container(
     width:getHorizontalSize(470),
    height: getVerticalSize(105),
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(
    color: Color(0xFFD9D9D9),
    style: BorderStyle.solid,
    width: getHorizontalSize(2)),
    boxShadow: [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 15,
    offset: Offset(2, -5),
        )
  ],
     borderRadius:BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),),
  child:
  Padding(
    padding:getPadding(left: 10,top: 15),
  child: Column(
      children: [
          Row(
             children: [
               Column(
                 children: [
                   Text(
                    ' Current price',
                     style: TextStyle(
                     color: Color(0xFF5D5E59),
                     fontSize:getFontSize(16) ,
                     fontWeight: FontWeight.bold),),
                 Text(
                "${currentPrice.toStringAsFixed(1)} s.p",
                 style: TextStyle(
                color: Color(0xFFFFA45D),
                fontSize: getFontSize(16),
                 fontWeight: FontWeight.bold),),
  SizedBox(height:getVerticalSize(10) ,),
     Row(
         children: [
         Text("Start Price  ",
         style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: getFontSize(16),
          color: Color(0xFF979797)),),
  SizedBox(width:getHorizontalSize(1),),
         Text("${startPrice.toStringAsFixed(1)} s.p",
          style: TextStyle(
          decoration: TextDecoration.lineThrough,
           decorationColor: Color(0xFFB7B7B7),
            decorationThickness: 1.5,
           fontWeight: FontWeight.bold,
           fontSize: getFontSize(18),
           color: Color(0xFFB7B7B7)),),
            ])
                 ]),
  Container(
       margin: getMargin(left: 40,right:10),
       width:getHorizontalSize(165) ,
       height:getVerticalSize(85),
       decoration: BoxDecoration(
        border: Border.all(
        color: Colors.white,
  ),
        borderRadius:BorderRadius.circular(10),),
  child:
       Column(
         mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
          ElevatedButton(
             onPressed: (){
               increasePrice();
               setState(() {
               _isJoined = true;
               });
               },
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0XFFFFCDAC),),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Color(0xFFFFA45D))
       ),
  ),
         minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),
  ),

  child:_isJoined
      ? const Icon(Icons.add,size: 18,color: Color(0xFF5D5E59),)
      : const Text('Join',style: TextStyle(fontSize: 18,
      color: Color(0xFF5D5E59),
      fontWeight: FontWeight.bold),),
          ),
      SizedBox(height:getVerticalSize(3),),
         Text("When clicking on the button the price increases by 10%",
         style: TextStyle(fontSize:getFontSize(11) ,
           color: Color(0xFFFFA45D),fontWeight: FontWeight.w500
               ),),
            ]
          ),
         )
       ]
      ),
      ]
     )
    ),
    ),
    ),
    ]
   ),
   )
  )
   );
   }
  }

