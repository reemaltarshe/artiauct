import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:handmade/core/units/size_utils.dart';
import 'package:get/get.dart';
import 'package:handmade/data/models/username.dart';
import 'package:handmade/view/category/bags.dart';
import 'package:handmade/view/category/candle.dart';
import 'package:handmade/view/detail_sale/detail_sale.dart';
import 'package:handmade/view/notification/notification.dart';
import 'package:handmade/view/auction_announcement/auction_announcement.dart';
import 'package:handmade/view/filter/filter.dart';
void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _MyHome();
}

class _MyHome extends State<Home> {
  String _searchTerm = '';
  String? filterValue = null;
  int selectedIndex=0;
  void _onSearchTextChanged(String query) {
    setState(() {
      _searchTerm = query;
    });
    print('Searching for: $_searchTerm');
  }
  RangeValues _selectedPriceRange = const RangeValues(0, 1000);
  String? sortValue1;

  Future<void> _showPriceFilterModal() async {
    final RangeValues? result = await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => RightSideModal(
          minPrice: 0,
          maxPrice: 1000,
          initialRange: _selectedPriceRange,
        ),

      ),
    );

    if (result != null) {
      setState(() {
        _selectedPriceRange = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: Color(0xFFFFF3E3),
            body:SingleChildScrollView(child:
            Column(
                children: [
                  Row(
                      children: [
                        Expanded(child:
                        Padding(
                          padding:getPadding(top: 40,left: 30,right: 10),
                          child: TextField(
                            onTap: (){
                              showSearch(context: context, delegate: CustomSearch());
                            },
                            style: TextStyle(height: getVerticalSize(1)),
                            onChanged: _onSearchTextChanged,
                            decoration: InputDecoration(fillColor: Colors.white,filled: true,
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Color(0xFFb7b7b7),
                              ),
                              prefixIcon: Icon(Icons.search,color: Color(0xFFb7b7b7),size:getSize(25),),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.camera_alt_outlined,color:Color(0xFFb7b7b7) ,size:getSize(24) ,),
                                onPressed: () {},),
                              contentPadding: getPadding(all: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color(0xFFb7b7b7),width:getHorizontalSize(1) ),
                              ),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                borderSide:BorderSide(color: Color(0xFFb7b7b7),),
                              ),
                            ),
                          ),
                        ),
                        ),
                        Container(margin: getMargin(top: 40,right: 20),
                            child: IconButton(onPressed: (){
                              Get.to(NNotification());
                            },
                                icon:Icon(Icons.notifications_none_outlined,
                                  size: getSize(35),color: Color(0xFF5D5E59),))
                        )
                      ]
                  ),
                  SizedBox(height: getVerticalSize(30),),
                  Row(
                      children: [
                        Padding(padding: getPadding(left: 15),child:  Text("All Featured",style: TextStyle(fontSize: getFontSize(20),fontWeight: FontWeight.bold),),),
                        SizedBox(width:getHorizontalSize(170) ,),
                        SizedBox(
                          width: getHorizontalSize(100),
                          height: getVerticalSize(40),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12),

                             child:Align(
                              child:   DropdownButtonHideUnderline(
                                child: DropdownButtonFormField2<String?>(
                                  offset: const Offset(-10, 0),
                                  dropdownMaxHeight: getVerticalSize(140),
                                  dropdownWidth: getHorizontalSize(110),
                                  dropdownPadding: getPadding(left: 1),
                                  value: sortValue1,
                                  hint: const Text('Sort'),
                                  icon: const Icon(Icons.arrow_drop_down, size: 20),
                                  buttonPadding: getPadding(left: 2, bottom: 1),
                                  isExpanded: true,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? newValue) async {
                                    if (newValue == 'Price range') {
                                      await _showPriceFilterModal();
                                    } else if (newValue != null) {
                                      setState(() {
                                        sortValue1 = newValue;
                                      });
                                    }
                                  },
                                  items: <String?>[
                                    'Price',
                                    'Price range',
                                    'Auction',
                                    'Direct sale',
                                  ].map<DropdownMenuItem<String?>>((String? value) {
                                    return DropdownMenuItem<String?>(
                                      value: value,
                                      child: Text(value ?? 'Category'),
                                    );
                                  }).toList(),
                                ),
                              ),
                             ),
                          ),
                        ),



                        SizedBox(width: 7,),

           ]
       ),
                  SizedBox(height:getVerticalSize(20),),
                  Container(

                      color: Colors.white,
                      height:getVerticalSize(98) ,
                      child:SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                    Get.to(Candles());
                                    },
                                    icon: Container(
                                      width: getHorizontalSize(60), // Set your desired size
                                      height: getVerticalSize(60),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white, // Background color of the circle (optional)
                                        border: Border.all( // Optional border
                                            color: Colors.white),
                                        image: DecorationImage(
                                          image: AssetImage('images/candle.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: getPadding(left: 2, ),child: Text("Candle",style: TextStyle(fontSize:getFontSize(12) ,fontWeight: FontWeight.bold),),),
                                  SizedBox(height: getVerticalSize(4),)
                                ]),
                            Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Your onPressed logic
                                    },
                                    icon: Container(
                                      width: getHorizontalSize(60), // Set your desired size
                                      height: getVerticalSize(60),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white, // Background color of the circle (optional)
                                        border: Border.all(
                                            color: Colors.white// Optional border
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage('images/decoration.jpg'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: getPadding(left: 2, ),child: Text("Decoration",style: TextStyle(fontSize:getFontSize(12),fontWeight: FontWeight.bold),),),
                                  SizedBox(height: getVerticalSize(4),)
                                ]),
                            Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Your onPressed logic
                                    },
                                    icon: Container(
                                      width: getHorizontalSize(60), // Set your desired size
                                      height: getVerticalSize(60),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white, // Background color of the circle (optional)
                                        border: Border.all(
                                            color: Colors.white// Optional border
                                        ),
                                        image: DecorationImage( // Your image
                                          image: AssetImage('images/painting.jpg'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding:getPadding(left: 2, ),child: Text("Painting",style: TextStyle(fontSize:getFontSize(12),fontWeight: FontWeight.bold),),),
                                  SizedBox(height:getVerticalSize(4),)
                                ]),
                            Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Your onPressed logic
                                    },
                                    icon: Container(
                                      width: getHorizontalSize(60), // Set your desired size
                                      height: getVerticalSize(60),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white, // Background color of the circle (optional)
                                        border: Border.all(
                                            color: Colors.white// Optional border
                                        ),
                                        image: DecorationImage( // Your image
                                          image: AssetImage('images/wool.jpg'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: getPadding(left: 2, ),child: Text("Wool",style: TextStyle(fontSize: getFontSize(12),fontWeight: FontWeight.bold),),),
                                  SizedBox(height: getVerticalSize(4),)
                                ]),
                            Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                     Get.to(Bags());// Your onPressed logic
                                    },
                                    icon: Container(
                                      width: getHorizontalSize(60), // Set your desired size
                                      height: getVerticalSize(60),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white, // Background color of the circle (optional)
                                        border: Border.all(
                                            color: Colors.white// Optional border
                                        ),
                                        image: DecorationImage( // Your image
                                          image: AssetImage('images/bag.jpg'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: getPadding(left: 2, ),child: Text("Bag",style: TextStyle(fontSize: getFontSize(12),fontWeight: FontWeight.bold),),),
                                  SizedBox(height: getVerticalSize(4),)
                                ]),
                            Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Your onPressed logic
                                    },
                                    icon: Container(
                                      width: getHorizontalSize(60), // Set your desired size
                                      height: getVerticalSize(60),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white, // Background color of the circle (optional)
                                        border: Border.all(
                                            color: Colors.white// Optional border
                                        ),
                                        image: DecorationImage( // Your image
                                          image: AssetImage('images/Accessoire.jpg'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: getPadding(left: 2, ),child: Text("Accessoires",style: TextStyle(fontSize: getFontSize(12),fontWeight: FontWeight.bold),),),
                                  SizedBox(height: getVerticalSize(4),)
                                ]),
                            Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Your onPressed logic
                                    },
                                    icon: Container(
                                      width: getHorizontalSize(60), // Set your desired size
                                      height: getVerticalSize(60),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white, // Background color of the circle (optional)
                                        border: Border.all(
                                            color: Colors.white// Optional border
                                        ),
                                        image: DecorationImage( // Your image
                                          image: AssetImage('images/coop.jpg'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: getPadding(left: 2, ),child: Text("Carving",style: TextStyle(fontSize:getFontSize(12) ,fontWeight: FontWeight.bold),),),
                                  SizedBox(height:getVerticalSize(4),)
                                ]),
                            Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Your onPressed logic
                                    },
                                    icon: Container(
                                      width: getHorizontalSize(60), // Set your desired size
                                      height: getVerticalSize(60),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white, // Background color of the circle (optional)
                                        border: Border.all(
                                            color: Colors.white// Optional border
                                        ),
                                        image: DecorationImage( // Your image
                                          image: AssetImage('images/sweet.jpg'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: getPadding(left: 2, ),child: Text("Sweet",style: TextStyle(fontSize: getFontSize(12),fontWeight: FontWeight.bold),),),
                                  SizedBox(height: getVerticalSize(4),)
                                ]),
                          ],
                        ),
                      )
                  ),
                  SizedBox(height:getVerticalSize(20),),
                  Container(child:
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child:
                    Column(
                        verticalDirection: VerticalDirection.down,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {Get.to(AuctionAnnouncement());},
                                child: Column(
                                  children: [
                                    Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                            child:
                                            Container(
                                              padding: getPadding(bottom: 94,left: 5),
                                              child:
                                              Row(
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
                              SizedBox(width:getHorizontalSize(5),),
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
                                                padding: getPadding(bottom: 94,left: 5),
                                                child:
                                                Row(
                                                    children: [
                                                      Icon(Icons.star,color:Color(0xFFFBBE21),size: getSize(20),),
                                                      SizedBox(width: getHorizontalSize(3),),
                                                      Text("4.5",style: TextStyle(fontSize:getFontSize(15) ,color: Colors.white,fontWeight: FontWeight.bold),),]),
                                                width: getHorizontalSize(200),
                                                height: getVerticalSize(120),
                                                decoration: BoxDecoration(
                                                  image:DecorationImage(image: AssetImage("images/photo2.jpg"),fit: BoxFit.fill,),
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
                                              Text("Piece Of Wood",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize: getFontSize(15)),),
                                              Text("170 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize:getFontSize(15) ),),
                                              SizedBox(height:getVerticalSize(10) ,),
                                              Row(
                                                  children: [
                                                    Container(
                                                      child: Image.asset("images/username.jpg",fit: BoxFit.fill,),
                                                      margin: getMargin(left: 5,),
                                                      width:getHorizontalSize(30),
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
                                                          fontSize:getFontSize(11) ,
                                                          fontWeight: FontWeight.bold,),),
                                                    )]),
                                            ]),
                                      )
                                    ]),),
                            ],
                          ),
                          SizedBox(height:getVerticalSize(20) ,),
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
                                                  padding: getPadding(bottom: 94,left: 5),
                                                  child:
                                                  Row(
                                                      children: [
                                                        Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20),),
                                                        SizedBox(width:getHorizontalSize(3),),
                                                        Text("4.5",style: TextStyle(fontSize:getFontSize(15) ,color: Colors.white,fontWeight: FontWeight.bold),),]),
                                                  width: getHorizontalSize(200),
                                                  height: getVerticalSize(120),
                                                  decoration: BoxDecoration(
                                                    image:DecorationImage(image: AssetImage("images/photo4.jpg"),fit: BoxFit.fill,),
                                                    border: Border.all(
                                                        style: BorderStyle.solid,
                                                        width: getHorizontalSize(0)),
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
                                                width: getHorizontalSize(1)),
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                          ),
                                          child: Column(
                                              children: [
                                                SizedBox(height:getVerticalSize(5) ,),
                                                Text("Strawberry Cake",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize:getFontSize(15) ),),
                                                Text("100 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize: getFontSize(15)),),
                                                SizedBox(height:getVerticalSize(10) ,),
                                                Row(
                                                    children: [
                                                      Container(
                                                        child: Image.asset("images/username.jpg",fit: BoxFit.fill,),
                                                        margin: getMargin(left: 5,),
                                                        width:getHorizontalSize(30) ,
                                                        height: getVerticalSize(30),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                              color: Colors.white,
                                                              style: BorderStyle.solid,
                                                              width:getHorizontalSize(1) ),
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
                                                  padding: getPadding(bottom: 94,left: 5),
                                                  child:
                                                  Row(
                                                      children: [
                                                        Icon(Icons.star,color:Color(0xFFFBBE21),size: getSize(20),),
                                                        SizedBox(width:getHorizontalSize(3) ,),
                                                        Text("4.0",style: TextStyle(fontSize:getFontSize(15) ,color: Colors.white,fontWeight: FontWeight.bold),),]),
                                                  width: getHorizontalSize(200),
                                                  height: getVerticalSize(120),
                                                  decoration: BoxDecoration(
                                                    image:DecorationImage(image: AssetImage("images/photo5.jpg"),fit: BoxFit.fill,),
                                                    border: Border.all(
                                                        style: BorderStyle.solid,
                                                        width: getHorizontalSize(0)),
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
                                                width: getHorizontalSize(1)),
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                          ),
                                          child: Column(
                                              children: [
                                                SizedBox(height:getVerticalSize(5) ,),
                                                Text("Wool Sweater",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize:getFontSize(15) ),),
                                                Text("80 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize: getFontSize(15)),),
                                                SizedBox(height: getVerticalSize(10),),
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
                                                              width:getHorizontalSize(1) ),
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
                              ]),
                          SizedBox(height:getVerticalSize(20) ,),
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
                                                  padding: getPadding(bottom: 94,left: 5),
                                                  child:
                                                  Row(
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
                                  onTap: () {Get.to(DetailSale());},
                                  child:
                                  Column(
                                      children: [
                                        Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                                child:
                                                Container(
                                                  padding: getPadding(bottom: 94,left: 5),
                                                  child:
                                                  Row(
                                                      children: [
                                                        Icon(Icons.star,color:Color(0xFFFBBE21),size:getSize(20) ,),
                                                        SizedBox(width:getHorizontalSize(3) ,),
                                                        Text("2.5",style: TextStyle(fontSize: getFontSize(15),color: Colors.white,fontWeight: FontWeight.bold),),]),
                                                  width: getHorizontalSize(200),
                                                  height:getVerticalSize(120) ,
                                                  decoration: BoxDecoration(
                                                    image:DecorationImage(image: AssetImage("images/photo6.jpg"),fit: BoxFit.fill,),
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
                                                Text("Simply Pinky Bracelet",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFA45D),fontSize:getFontSize(15) ),),
                                                Text("5 000 s.p",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFB7B7B7),fontSize: getFontSize(15)),),
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
                                      ]),)
                              ]),
                        ]),




                  )
                  )
                ]
            )
            )
        )
    );
  }
}


