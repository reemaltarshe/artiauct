import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:handmade/view/messages/chat_model.dart';
import 'package:handmade/controllers/message_controller.dart';
import 'message_widget.dart';

void main() {
  runApp(Chatting());
}

class Chatting extends StatefulWidget {
  const Chatting({super.key});

  @override
  State<Chatting> createState() => _chattingState();
}

class _chattingState extends State<Chatting> {
  final MessageController messageController = Get.put(MessageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _chatTextField(),
      backgroundColor: Color(0xffFFbd80),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
              padding: getPadding(left: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {Get.back();},
                    icon: Icon(Icons.arrow_back),
                    color: Color(0xff5D5E59),
                    iconSize: 30,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage("images/username.jpg"),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "User Name",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5D5E59)),
                  )
                ],
              )),
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Obx(() => ListView.separated(
                    itemBuilder: (context, index) => Bubblemessage(
                      message: messageController.messages[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8,
                    ),
                    itemCount: messageController.messages.length)),
              ))
        ],
      ),
    );
  }

  Widget _chatTextField() {
    return Container(
      padding: getPadding(left: 20,right: 20, top: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height:getVerticalSize(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color(0xffFFF3E3),
        ),
        child: Row(
          children: [
            Expanded(
                child: Obx(() => TextField(
                  controller: messageController.messageController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "  Enter your message",
                      hintStyle: TextStyle(fontSize: 16, color: Color(0xffB7B7B7))),
                ))),
            Obx(() => CircleAvatar(
              backgroundColor: Color(0xffFFbd80),
              child: IconButton(
                icon: Icon(Icons.send, color: Color(0xff5D5E59)),
                onPressed: messageController.isLoading.value ? null : () {
                  messageController.sendCurrentMessage();
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
