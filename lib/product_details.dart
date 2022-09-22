import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

class ProductDetails extends StatefulWidget{
  @override
  _ProductDetails createState() => _ProductDetails();
}

class _ProductDetails extends State<ProductDetails>{
  PageController? _pageController;
  List<String> _art = ['assets/bambuk.jpg', 'assets/bambuk1.jpg', 'assets/bambuk.jpg', 'assets/bambuk1.jpg'];

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: back,
        body: Column(
            children: [
              SizedBox(height: 50,),
              _backAndBasket(),
              SizedBox(height: 20,),
              _imageCarousel(),
              SizedBox(height: 10,),
              _productDetails(),
            ],
          ),
        ),
    );
  }
  
  Row _backAndBasket() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: darkBlue,
          ),
          child:  Center(child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,))
        ),
        Text('Product details', style: TextStyle(color: darkBlue, fontSize: 18, fontWeight: FontWeight.w500),),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: orange
          ),
          child: Center(child: Icon(Icons.shopping_basket_outlined, color: Colors.white,),),
        ),
      ],
    );
  }

  Widget _imageCarousel() {
    return Container(
      height: 270,
      child: PageView.builder(
          itemCount: _art.length,
          pageSnapping: true,
          controller: _pageController,
          itemBuilder: (context, pagePosition) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6,
                    offset: Offset(0,4)
                  )
                ]
              ),
              child:   ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:  Image.asset(
                  _art[pagePosition],
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,),
              ),
            );
          }),
    );
  }

  Widget _productDetails(){
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Galaxy Note 20 Ultra', style: TextStyle(color: darkBlue, fontSize: 24, fontWeight: FontWeight.w500),),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: darkBlue,
                      ),
                      child: Center(child: Icon(Icons.add_circle_outline, color: Colors.white),),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber,),
                    Icon(Icons.star, color: Colors.amber,),
                    Icon(Icons.star, color: Colors.amber,),
                    Icon(Icons.star, color: Colors.amber,),
                    Icon(Icons.star, color: Colors.amber,),
                  ],
                ),
                
              ],
            ),
          ),
        )
    );
  }

}