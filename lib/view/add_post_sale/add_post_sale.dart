
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';
import 'package:handmade/view/main_screen/main_screen.dart';
void main() {
  runApp(AddPostSale());
}

class AddPostSale extends StatefulWidget {
  const AddPostSale({super.key});
  @override
  State<AddPostSale> createState() => _MyAddPostSale();
}
class _MyAddPostSale extends State<AddPostSale> {
  String? sortValue = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          backgroundColor: Color(0xFFFFF3E3),
          body:SingleChildScrollView(
            child:  Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: getMargin(left: 10,right: 10,top: 30,bottom: 5),
                      alignment: Alignment.topLeft,
                      child:
                      IconButton(onPressed: (){
                        Get.back();

                      },
                          icon: Icon(Icons.arrow_back_sharp),
                          color: Colors.black,
                          iconSize: getSize(30)),
                    ),
                    SizedBox(width: getHorizontalSize(80),),
                    Container(
                      margin: getMargin(left: 10,right: 10,top: 30,bottom: 5),
                      child:Text("Add Post",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:getFontSize(22),color: Color(0xFF5D5E59),
                            fontWeight: FontWeight.bold),),),
                  ],
                ),
                Container(
                  child: DottedBorder(
                    color: Color(0xFFFFA45D),
                    strokeWidth: getHorizontalSize(2),
                    dashPattern: [10, 10],
                    child: Container(
                      width: getHorizontalSize(350),
                      height: getVerticalSize(200),
                      child: Center(
                        child: DottedBorder(
                          borderType: BorderType.Circle,
                          radius: Radius.circular(50),
                          color: Color(0xFFFFA45D),
                          strokeWidth: getHorizontalSize(2),
                          dashPattern: [10, 10],
                          child: Container(
                            margin: getMargin(left: 5,bottom: 5,right: 5,top: 5),
                            decoration: BoxDecoration(shape: BoxShape.circle,
                              color: Color(0xFFFFA45D),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Color(0xFFFFA45D),
                                  width:getHorizontalSize(2)),),
                            child:Container(
                              width: getHorizontalSize(50),
                              height: getVerticalSize(50),
                              child:IconButton(style: ButtonStyle(),
                                  onPressed: (){},
                                  icon: Icon(Icons.camera_alt_outlined),
                                  color: Colors.white,
                                  iconSize: getSize(30)),),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:getVerticalSize(15),),
                Container(
                  margin: getMargin(right: 210),
                  child:Text("Name Of Broduct:",
                    style: TextStyle(fontSize:getFontSize(16),
                    ),),),
                SizedBox(height:getVerticalSize(1),),
                Padding(padding: getPadding(left: 30,right: 30),
                  child: TextField(
                    decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 4),fillColor: Colors.white,filled: true,
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder()),),),
                SizedBox(height: getVerticalSize(12),),
                Container(
                  margin: getMargin(right: 250),
                  child:Text("Description:",
                    style: TextStyle(fontSize:getFontSize(16) ,
                    ),),),
                SizedBox(height:getHorizontalSize(1),),
                Padding(padding: getPadding(left: 30,right: 30),
                  child: TextField(maxLines: 2,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),fillColor: Colors.white,filled: true,
                      border: OutlineInputBorder(),),),),
                SizedBox(height:getVerticalSize(12),),
                Container(
                  margin: getMargin(right: 295),
                  child:Text("Price:",
                    style: TextStyle(fontSize: getFontSize(16),
                    ),),),
                SizedBox(height:getVerticalSize(2),),
                Padding(padding: getPadding(left: 30,right: 30),
                  child: TextField(
                    decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 4),
                      focusedBorder: OutlineInputBorder(),fillColor: Colors.white,filled: true,
                      border: OutlineInputBorder(),),),),
                SizedBox(height: getVerticalSize(12),),
                Container(
                  margin: getMargin(right: 270),
                  child:Text("Category:",
                    style: TextStyle(fontSize: getFontSize(16),
                    ),),),
                SizedBox(height: getVerticalSize(1),),
                SizedBox(
                  width: getHorizontalSize(350),
                  height: getVerticalSize(45),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: getHorizontalSize(1)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:Align(
                      //alignment: Alignment.centerRight,
                      child: DropdownButtonHideUnderline(
                        child:DropdownButtonFormField2<String?>(
                          offset:  Offset(350 - 200, 0),
                          dropdownMaxHeight: getVerticalSize(200),
                          dropdownWidth: getHorizontalSize(200),
                          dropdownPadding:getPadding(left: 20),
                          value: sortValue,
                          hint: const Text('Category'),
                          icon: const Icon(Icons.arrow_drop_down),
                          buttonPadding: getPadding(right: 10,left: 10),
                          isExpanded: true,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                sortValue = newValue;
                              });
                            }
                          },

                          items: <String?>[
                            //null,
                            'Candle',
                            'Accessories',
                            'Decoration',
                            'Carving',
                            'Sweet',
                            'Bags',
                            'Painting',
                            'Wool',
                            'Other',
                          ].map<DropdownMenuItem<String?>>((String? value) {
                            return DropdownMenuItem<String?>(
                              value: value,
                              child:
                              Text(value ?? 'Category',),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: getVerticalSize(10),),
                Container(
                  padding: getPadding(left: 30,right: 30,top: 20),
                  child: Column(
                    children: [
                      MaterialButton(onPressed: (){
                        Get.to(MainScreen());
                      },child: Text("Add",style: TextStyle(fontSize: getFontSize(16)),),color:Color(0XFFFFCDAC),minWidth: 195,height: 40,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),)
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
