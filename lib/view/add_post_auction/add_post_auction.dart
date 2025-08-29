import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';
import 'package:handmade/controllers/auction_controller.dart';
import 'package:handmade/view/home/home.dart';
import 'package:handmade/view/main_screen/main_screen.dart';

void main() {
  runApp(AddPostAuction());
}

class AddPostAuction extends StatefulWidget {
  const AddPostAuction({super.key});
  @override
  State<AddPostAuction> createState() => _MyAddPostAuction();
}
class _MyAddPostAuction extends State<AddPostAuction> {
  final AuctionController auctionController = Get.put(AuctionController());
  String sortValue = 'Candle';

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
                    margin: getMargin(top:30,left: 10,right: 10,bottom: 5),
                    alignment: Alignment.topLeft,
                    child:
                    IconButton(onPressed: (){
                      Get.back();
                    },
                        icon: Icon(Icons.arrow_back_sharp),
                        color: Colors.black,
                        iconSize: getSize(30)),
                  ),
                  SizedBox(width:getHorizontalSize(80)),
                  Container(
                    margin: getMargin(top:30,left: 10,right: 10,bottom: 5),
                    child:
                    Text("Add Post",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: getFontSize(22),
                          color: Color(0xFF5D5E59),
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
                                width:getHorizontalSize( 2)),),
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
              SizedBox(height: getVerticalSize(15),),
              Container(
                margin: getMargin(right: 220),
                child:Text("Name Of Product:",
                  style: TextStyle(fontSize: getFontSize(16),),),),
              SizedBox(height:getVerticalSize(2) ,),
              Padding(padding: getPadding(left: 30,right: 30),
                child: Obx(() => TextField(
                  controller: auctionController.nameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 3),
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder()),
                )),),
              SizedBox(height:getVerticalSize(10) ,),
              Container(
                margin: getMargin(right: 260),
                child:Text("Description:",
                  style: TextStyle(fontSize: getFontSize(16),),),),
              SizedBox(height:getVerticalSize(2) ,),
              Padding(padding:getPadding(left: 30,right: 30),
                child: Obx(() => TextField(
                  controller: auctionController.descriptionController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                  ),
                )),),
              SizedBox(height:getVerticalSize(10) ,),
              Container(
                margin: getMargin(right: 270),
                child:Text("Start Price:",
                  style: TextStyle(fontSize: getFontSize(16),),),),
              SizedBox(height:getVerticalSize(2) ,),
              Padding(padding: getPadding(left: 30,right: 30),
                child: Obx(() => TextField(
                  controller: auctionController.startPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                  ),
                )),),
              SizedBox(height: getVerticalSize(10),),
              Container(
                margin: getMargin(right: 280),
                child:Text("Category:",
                  style: TextStyle(fontSize: getFontSize(16),color: Colors.black),),),
              SizedBox(height:getVerticalSize(2) ,),
              SizedBox(
                width:getHorizontalSize(350),
                height:getVerticalSize(45) ,
                child:
                Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButtonHideUnderline(
                    child:DropdownButton2<String>(
                      dropdownOverButton: true,
                      offset: Offset(385-200,0),
                      dropdownMaxHeight: getVerticalSize(200),
                      dropdownWidth: getHorizontalSize(200),
                      dropdownPadding:getPadding(left: 20),
                      alignment: AlignmentDirectional.centerEnd,
                      value: sortValue,
                      hint: Text('Category',), // Hint text
                      icon: Icon(Icons.arrow_drop_down),
                      isExpanded: true,
                      style: TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          sortValue = newValue!;
                        });
                        auctionController.categoryController.text = newValue!;
                      },
                      items: <String>[
                        'Candle',
                        'Accessories',
                        'Decoration',
                        'Carving',
                        'Sweet',
                        'Bags',
                        'Painting',
                        'Wool',
                        'Other',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height:getVerticalSize(10) ,),
              Container(
                margin: getMargin(right: 280),
                child:Text("End Date:",
                  style: TextStyle(fontSize: getFontSize(16),),),),
              SizedBox(height:getVerticalSize(2),),
              Padding(padding: getPadding(left: 30,right: 30),
                child: Obx(() => TextField(
                  controller: auctionController.endDateController,
                  readOnly: true,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(Duration(days: 1)),
                      firstDate: DateTime.now().add(Duration(days: 1)),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (picked != null) {
                      auctionController.setEndDate(picked);
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                )),),
              SizedBox(height: getVerticalSize(10),),
              Container(
                  padding: getPadding(top: 10,left: 30,right: 30),
                  child:
                  Obx(() => MaterialButton(
                    onPressed: auctionController.isLoading.value ? null : () async {
                      final success = await auctionController.createAuction();
                      if (success) {
                        auctionController.showSuccess('Auction created successfully!');
                      } else {
                        auctionController.showError(auctionController.errorMessage.value);
                      }
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: auctionController.isLoading.value 
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text("Add", style: TextStyle(fontSize: getFontSize(16))),
                    color: Color(0XFFFFCDAC),
                    minWidth: getHorizontalSize(195),
                    height: getVerticalSize(40),
                  ))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
