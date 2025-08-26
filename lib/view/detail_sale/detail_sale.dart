import 'package:flutter/material.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';
import 'package:handmade/controlies/RatingController.dart';
import 'package:handmade/view/comment/comment.dart';
import 'package:handmade/view/messages/chatting.dart';


class DetailSale extends StatefulWidget {
  const DetailSale({super.key});
  @override
  State<DetailSale> createState() => _MyADetailSale();
}
class _MyADetailSale extends State<DetailSale> {
  final controller = Get.put(RatingController());

  bool isFavorite = false;
  int wishlistItemCount = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
            body:Column(
              children: [
                Row(
                    children: [
                      Container(
                        margin: getMargin(top: 30,left: 10),
                        alignment: Alignment.topLeft,
                        child:
                        IconButton(
                            onPressed: () async{
                          controller.showRating(context);
                        },
                            icon: Icon(Icons.arrow_back_sharp),
                            color: Colors.black,
                            iconSize: getSize(30)),
                      ),
                      SizedBox(width:getHorizontalSize(110) ,),
      Container(
          margin: getMargin(top: 30,left: 10),
                      child:
                      Text("Detail",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: getFontSize(22),color: Color(0xFF5D5E59),
                            fontWeight: FontWeight.bold),),),
                      SizedBox(width:getHorizontalSize(110) ,),
    Container(
            margin: getMargin(top: 30,left: 10),
                      child:
                      IconButton(
                          onPressed: (){
                          setState(() {
                          isFavorite = !isFavorite;
                          if (isFavorite) {
                            wishlistItemCount = 1;
                          } else {
                            wishlistItemCount = 0;
                          }
                          });
                          },
                          icon:Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey[700]),
                          iconSize: getSize(30)))
                    ]
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
                SizedBox(height: getVerticalSize(10),),
                Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child:  Container(
                          width: getHorizontalSize(350),
                          height:getVerticalSize(240) ,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("images/photo6.jpg",),fit: BoxFit.cover),
                              border: Border.all(
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
                Container(
                    margin:getMargin(right: 150,top:5),
                    child:
                    Column(
                        children: [
                          Text("Simply Pinky Bracelet",style: TextStyle(fontSize:getFontSize(20),fontWeight: FontWeight.bold ,color: Color(0xFFFFA45D)),),
                          Padding(padding:getPadding(right: 100),child: Text("with biscuit",style: TextStyle(fontSize:getFontSize(17) ,color: Color(0xFFb7b7b7)),),)
                        ])
                ),
                SizedBox(height:getVerticalSize(10) ,),
                Row(
                  children: [
                    SizedBox(width:getHorizontalSize(27) ,),
                    Icon(Icons.star,color:Color(0xFFFBBE21),size: getSize(30),),
                    SizedBox(width:getHorizontalSize(1) ,),
                   Obx(() =>Text("${controller.totalRatings.value}",style: TextStyle(fontSize: getFontSize(20),fontWeight: FontWeight.bold),),),
                    Padding(padding: getPadding(top: 10),child: Text("(230)",style: TextStyle(color:Color(0xFFb7b7b7),fontSize:getFontSize(15) ),),)
                  ],
                ),
                SizedBox(height:getVerticalSize(5) ,),
                Container(
                    padding: getPadding(left: 35,right: 35),
                    child:
                    Divider(
                      color: Color(0xFFFFA45D),
                      thickness: 3,
                      height: getVerticalSize(10),
                    )
                ),
                SizedBox(height:getVerticalSize(10) ,),
                Padding(padding: getPadding(right: 230),child: Text("Description",style: TextStyle(fontSize:getFontSize(20) ,fontWeight: FontWeight.bold,color: Color(0xFFFFA45D)),),),
                Text.rich(TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:'Merry Christmas....We have made this candle \nwith full of love to celebrate in this special \noccasion.....',
                        style: TextStyle(color: Color(0xFF5D5E59),fontSize:getFontSize(16) ),
                      ),
                      TextSpan(
                          text: 'Read More' ,
                          style: TextStyle(color: Color(0xFFFFA45D),fontSize: getFontSize(16),fontWeight: FontWeight.bold)
                      )
                    ]
                )
                ),
                SizedBox(height:getVerticalSize(108) ,),
                Container(
                  width: getHorizontalSize(410),
                  height: getVerticalSize(96),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:Border.all(
    color: Color(0xFFD9D9D9),
    style: BorderStyle.solid,
    width: getHorizontalSize(2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius:2,
                        blurRadius: 15,
                        offset: Offset(2,-5),
                      )
                    ],
                    borderRadius:BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),),
                  child:  Padding(padding:getPadding(left: 30,top: 6),
                    child: Row(
                      children: [
                        Text.rich(TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:'Price \n',
                                style: TextStyle(color: Color(0xFF5D5E59),fontSize:getFontSize(16) ,fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: '5.000 s.p' ,
                                  style: TextStyle(color: Color(0xFFFFA45D),fontSize: getFontSize(22),fontWeight: FontWeight.bold)
                              )
                            ]
                        )
                        ),
                        SizedBox(width:getHorizontalSize(75),),
                        MaterialButton(onPressed: (){Get.to(Chatting());},
                          child: Text("Contact us",
                            style: TextStyle(fontSize:getFontSize(16) ,
                                color: Color(0xFF5D5E59),
                                fontWeight: FontWeight.bold),),
                          color: Color(0XFFFFCDAC),
                          minWidth:getHorizontalSize(190) ,
                          height: getVerticalSize(60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
    side: BorderSide(color: Color(0xFFFFA45D)),))
                      ],
                    ),
                  ),
                )
              ],)
        )
    );
  }
}

