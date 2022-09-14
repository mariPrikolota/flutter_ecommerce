import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: back,
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 40,),
                _selectCategory(context),
                SizedBox(height: 10,),
                _hotSales(),
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

  Column _hotSales() {
    return Column(
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
        Container(
          height: 230,
          child:   Stack(
            children: [
              Image.asset('assets/bambuk.jpg', fit: Boxfit.)
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ],
    );
  }

}
