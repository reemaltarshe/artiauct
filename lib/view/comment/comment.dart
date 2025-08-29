import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:handmade/controllers/comment_controller.dart';
import 'package:handmade/view/signup/signup.dart';


class ProductCommentsSection extends StatefulWidget {
  @override
  _ProductCommentsSectionState createState() => _ProductCommentsSectionState();
}

class _ProductCommentsSectionState extends State<ProductCommentsSection> {
  final CommentController commentController = Get.put(CommentController());

  void _addComment() {
    commentController.addCurrentComment();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Comments ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFA45D),
                ),
              ),SizedBox(width: 3,),
              Obx(() => Text('(${commentController.commentCount})',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color(0xFFFFA45D),
              ),),
            ],
          ),

          const SizedBox(height: 12),
          Obx(() => ...commentController.comments.map((comment) => Card(

            margin: EdgeInsets.symmetric(vertical: 6),
            elevation: 0,

            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xffFFbd80),
                child: Icon(Icons.person, color: Color(0xff5D5E59)),
              ),
              title: Text(style: TextStyle(fontSize: getFontSize(15)),comment['comment'], textAlign: TextAlign.left),
            ),
          )),
          Divider(color: Color(0xFFFFA45D),
            height:getVerticalSize(30) ,
            thickness: 1,
            indent: 10,
            endIndent: 25,),
          Row(
            children: [
              Expanded(
                child: Obx(() => TextField(
                  controller: commentController.commentController,
                  decoration: InputDecoration(
                    hintText: 'Write comment...',
                    hintStyle: TextStyle(fontSize: 17, color: Color(0xff5D5E59)),
                    contentPadding: EdgeInsets.only(top: 1, left: 12,right: 12,bottom: 10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color:Color(0xFFFFA45D),width: 1),
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  bool isLoggedIn = false;
                  if (isLoggedIn) {
                    _addComment();
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()), // الانتقال لصفحة تسجيل الدخول إذا لم يكن مسجل الدخول
                    );
                  }
                },
                child: Container(
                  margin: getMargin(right: 30,bottom: 10),
                  child:
                CircleAvatar(
                  backgroundColor:  Color(0xffFFbd80),
                  child: Icon(Icons.send, color: Color(0xff5D5E59)),
                ),),
              ),
            ],
          )
        ],
      ),
    );
  }
}