import 'package:flutter/cupertino.dart';
import 'chat_model.dart';
import 'package:get/get.dart';


class Bubblemessage extends StatefulWidget {
  final Message message;
  const Bubblemessage({super.key,required this.message});

  @override
  State<Bubblemessage> createState() => _messageState();
}

class _messageState extends State<Bubblemessage> {
  bool showTime = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Align(alignment:widget.message.recived ?Alignment.centerLeft:Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [GestureDetector(
                onTap: () => {
                  setState(() {
                    showTime=!showTime;
                  })
                }, child:
            Container(
              padding: EdgeInsets.all(14),
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.message.recived?Color(0xffFFF3E3):Color(0xffFFbd80)),
              child: Text(widget.message.text, style: TextStyle(
                  fontSize: 18, height: 1.4,color: Color(0xff5D5E59)),),
            )),
              SizedBox(height: 8,),
              if(showTime)...[Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text(widget.message.timeStamp, style: TextStyle(fontSize: 12),),
              )
              ]
            ],
          )),
    );
  }
}
