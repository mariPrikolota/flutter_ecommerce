import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/utilities/constants.dart';

import 'model.dart';
import 'product_details.dart';

class HomeStore extends StatefulWidget {

  @override
  _HomeStore createState() => _HomeStore();
}

class _HomeStore extends State<HomeStore> {
  List<IconData> iconCategory = [
    Icons.phone_android,
    Icons.computer,
    Icons.car_repair,
    Icons.menu_book_sharp
  ];
  int selectIndex = 0;
  List<bool> boolCategory = [true, false, false, false];
  List<String> art = ['assets/bambuk.jpg', 'assets/bambuk1.jpg', 'assets/bambuk.jpg', 'assets/bambuk1.jpg'];
  int likeIconIndex = 0;
  bool boolIconIndex = false;
  final _brand = ['Apple','Xiaomi','Samsung','Huawei'];
  var _newBrand = 'Apple';

  // late Future<HotSales> objectHotSales;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   objectHotSales = PhoneApi().fetchHotSales();
  //
  //   objectHotSales.then((phon) {
  //     print(phon.title);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: back,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Expanded(child: _selectCategory(context)),
                SizedBox(height: 10,),
                Expanded(
                  flex: 2,
                  child:SingleChildScrollView(
                    child:  Column(
                      children: [
                        _hotSales(),
                        SizedBox(height: 10,),
                        _bestSeller(context),
                      ],
                  ),
                ),
                )
              ],
            ),
          ),
      ),
    );
  }

  Widget _selectCategory(context) {
    List<String> textCategory = ['Phones', 'Computer', 'Health', 'Books'];

    return Container(
      height: 230,
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Category',
                  style: TextStyle(
                      color: darkBlue, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'view all',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 20,),
                itemBuilder: (context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectIndex = index;
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: index == selectIndex ? orange : Colors.white),
                          child: Center(
                            child: Icon(iconCategory[index], color:  index == selectIndex ? Colors.white : Colors.grey,),
                          ),
                        ),
                      ),
                      SizedBox(height: 4,),
                      Text(
                        '${textCategory[index]}',
                        style: TextStyle(
                            color: index == selectIndex  ? orange : darkBlue,
                            fontSize: 15),
                      )
                    ],
                  );
                },
              ),
            ),
           Container(
             child:  Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
               SizedBox(
               width: 270,
               height: 40,
               child: TextField(
                 decoration: InputDecoration(
                   labelText: 'Search',
                   border: InputBorder.none,
                   fillColor: Colors.white,
                   filled: true,
                   prefixIcon: Icon(
                     Icons.search,
                     color: orange,
                   ),
                   enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(20)),
                       borderSide: BorderSide.none
                   ),
                   focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(20)),
                       borderSide: BorderSide(color: orange, width: 2)
                   ),

                 ),
               ),
             ),
             Container(
               width: 40,
               height: 40,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 color: orange,
               ),
               child: Center(
                 child: Icon(Icons.menu, color: Colors.white,),
               ),
             ),
              ],
             ),
            ),

          ],
        ),
    );
  }

  Container _hotSales() {
    return Container(
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hot sales',
                style: TextStyle(
                    color: darkBlue, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'see more',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ],
          ),
        SizedBox(height: 5,),
        Expanded(
            child:   PageView.builder(
                itemCount: art.length,
                pageSnapping: true,
                itemBuilder: (context,pagePosition){
                  return  Container(
                    width: double.infinity,
                    child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:  Image.asset(
                              art[pagePosition],
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, top: 15, bottom: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: orange
                                  ),
                                  child: Center(
                                    child: Text('New', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text("Iphone 12",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25 )),
                                Text("Súper. Mega. Rápido.",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11 )),
                                SizedBox(height: 15,),
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    width: 130,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(
                                      child: Text('Buy now!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                    ),
                                  ),
                                )
                              ]
                            ),
                          ),
                        ]
                    ),
                  );
                }
            ),
        )
        ],
      ),
    );
  }

  Column _bestSeller(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Best Seller',
              style: TextStyle(
                  color: darkBlue, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: (){
                  _filterOptions(context);
                },
                child: Text(
                  'see more',
                  style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.normal),
                ),),
          ],
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails()));
          },
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: art.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                    width: 90,
                    height: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child:  Image.asset(
                                art[index],
                                width: double.infinity,
                                height:120,
                                fit: BoxFit.fill,),
                            ),
                            Text("1,047",
                                style: TextStyle(
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                )),
                            Text("Samsung Galaxy s20 Ultra",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10
                                )),
                          ],
                        ),
                        Align(
                            alignment: Alignment(0.9,- 0.85),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if (boolIconIndex == false){
                                    boolIconIndex = true;
                                  }else {
                                    boolIconIndex = true;
                                  }
                                  likeIconIndex = index;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white
                                ),
                                child:Center(
                                    child:
                                    index == likeIconIndex
                                        ? Icon(Icons.add_circle, color: orange,)
                                        : Icon(Icons.add_circle_outline, color: orange,)
                                ),
                              ),
                            )
                        )
                      ],
                    )
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _filterOptions(context){
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
        ) ,
        builder: (bc){
      return Container(
        height: MediaQuery.of(context).size.height * 60,
        child: Padding(
          padding: EdgeInsets.all(40),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: darkBlue,
                      ),
                      child: Center(child: Icon(Icons.close, color: Colors.white,),),
                    ),
                  ),
                  Text('Filter options', style: TextStyle(color: darkBlue, fontSize: 20),),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: orange,
                      ),
                      child: Center(child: Text('Done', style: TextStyle(color: Colors.white, fontSize: 18),)),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Brand ', style: TextStyle(color: darkBlue, fontSize: 20, fontWeight: FontWeight.bold),),
                  DropdownButton(
                    items: _brand.map((dropDownString) {
                      return DropdownMenuItem<String>(
                        value: dropDownString,
                        child: Text(dropDownString),
                      );
                    }).toList(),
                    onChanged: (newValueSelected) {
                      setState(() {
                        _newBrand = newValueSelected as String;
                      });
                    },
                    value: _newBrand,
                    isExpanded: true,
                    style: TextStyle(color: darkBlue, fontSize: 18),
                    borderRadius: BorderRadius.circular(6),
                    focusColor: darkBlue,
                  ),
                  SizedBox(height: 20,),
                  Text('Price', style: TextStyle(color: darkBlue, fontSize: 20, fontWeight: FontWeight.bold),),
                  DropdownButton(
                    items: _brand.map((dropDownString) {
                      return DropdownMenuItem<String>(
                        value: dropDownString,
                        child: Text(dropDownString),
                      );
                    }).toList(),
                    onChanged: (newValueSelected) {
                      setState(() {
                        _newBrand = newValueSelected as String;
                      });
                    },
                    value: _newBrand,
                    isExpanded: true,
                    style: TextStyle(color: darkBlue, fontSize: 18),
                    borderRadius: BorderRadius.circular(6),
                    focusColor: darkBlue,
                  ),
                  SizedBox(height: 20,),
                  Text('Size', style: TextStyle(color: darkBlue, fontSize: 20, fontWeight: FontWeight.bold),),
                  DropdownButton(
                    items: _brand.map((dropDownString) {
                      return DropdownMenuItem<String>(
                        value: dropDownString,
                        child: Text(dropDownString),
                      );
                    }).toList(),
                    onChanged: (newValueSelected) {
                      setState(() {
                        _newBrand = newValueSelected as String;
                      });
                    },
                    value: _newBrand,
                    isExpanded: true,
                    style: TextStyle(color: darkBlue, fontSize: 18),
                    borderRadius: BorderRadius.circular(6),
                    focusColor: darkBlue,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
