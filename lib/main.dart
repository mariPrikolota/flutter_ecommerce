import 'package:flutter/material.dart';
import 'home_store.dart';

void main() {
  runApp(MaterialApp(home : Home()));
}

Color darkBlue = Color(0xff010035);
Color orange = Color(0xffFF6E4E);
Color back = Color(0xffE5E5E5);


class Home extends StatefulWidget {

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                color: darkBlue
            ),
            Container(
              width: 132,
              height: 132,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: orange,
              ),
            ),
            butten(context),
          ],
        ),
    );
  }
}

Widget butten(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeStore()));
    },
    child: Container(
      width: 180,
      height: 68,
      margin: EdgeInsets.only(left: 120),
      child: Text(
        'Ecommerce Concept',
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
