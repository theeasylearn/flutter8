import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';
import 'package:flutter_rating/flutter_rating.dart';
class ProductDetail extends StatefulWidget {
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int currentPageIndex = 0;

  var productList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final List<Map<String, dynamic>> products = [
    {
      "category": "Mobile",
      "name": "iPhone 16 Pro Max",
      "price": "Rs 125000",
      "image": "images/iphone.jpg"
    },
    {
      "category": "Laptop",
      "name": "MacBook Air M3",
      "price": "Rs 99000",
      "image": "images/macbook.jpg"
    },
    {
      "category": "Watch",
      "name": "Apple Watch Ultra",
      "price": "Rs 85000",
      "image": "images/apple_watch.jpg"
    },
    {
      "category": "Tablet",
      "name": "iPad Pro 2024",
      "price": "Rs 115000",
      "image": "images/ipad.jpg"
    },
    {
      "category": "Earbuds",
      "name": "AirPods Pro 3",
      "price": "Rs 25000",
      "image": "images/airpods.jpg"
    },
    {
      "category": "Smart TV",
      "name": "Apple TV 8K",
      "price": "Rs 145000",
      "image": "images/apple_tv.jpg"
    },
  ];
  double rating = 3.0;
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Product Review',
                style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                      child:
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                            labelText: 'Review',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0), // Optional: rounded border
                            ),
                            prefixIcon: Icon(Icons.keyboard),
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            fillColor: AppColors.inputBackground(), filled: true
                        ),

                      ),
                  ),
                  Expanded(
                      flex: 1,
                      child:
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_forward_sharp),
                      ),)
                ],
              )
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyNavigationBar.getNavigationBar(),
        body: Material(
          color: AppColors.textColor(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                color: AppColors.productBackground(),
                elevation: 10,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {

                          },
                          child: Icon(Icons.share,size: 32,),
                        ),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(),
                        items: productList
                            .map((item) => Container(
                          child: Center(
                              child:
                              Image.network(item, fit: BoxFit.cover, width: 1000)),
                        ))
                            .toList(),
                      ),
                      Text(
                        "IPhone 16 pro max",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rs 125000",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "100 Left in stock",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "6.1 Inch",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "578 Grams",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "IPhone 16 pro max",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: StarRating(
                              size: 40,
                              rating: rating,
                              color: Colors.orange,
                              borderColor: Colors.grey,
                              allowHalfRating: false,
                              starCount: 5,
                              onRatingChanged: (rating) => setState(() {
                                this.rating = rating;
                              }),
                            ),
                          ),
                          Expanded(
                              flex:  2,
                              child: ElevatedButton(
                                  onPressed: () {
                                    _showBottomSheet();
                                  }, child: Text("Review"))
                          )
                        ],
                      ),
                      Text("BUILT FOR APPLE INTELLIGENCE — Apple Intelligence is the personal intelligence system that helps you write, express yourself and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple. BUILT FOR APPLE INTELLIGENCE — Apple Intelligence is the personal intelligence system that helps you write, express yourself and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple. BUILT FOR APPLE INTELLIGENCE — Apple Intelligence is the personal intelligence system that helps you write, express yourself and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple. BUILT FOR APPLE INTELLIGENCE — Apple Intelligence is the personal intelligence system that helps you write, express yourself and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple. BUILT FOR APPLE INTELLIGENCE — Apple Intelligence is the personal intelligence system that helps you write, express yourself and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple. BUILT FOR APPLE INTELLIGENCE — Apple Intelligence is the personal intelligence system that helps you write, express yourself and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple. BUILT FOR APPLE INTELLIGENCE — Apple Intelligence is the personal intelligence system that helps you write, express yourself and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple. BUILT FOR APPLE INTELLIGENCE — Apple Intelligence is the personal intelligence system that helps you write, express yourself and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple. BUILT FOR APPLE INTELLIGENCE — Apple Intelligence is the personal intelligence system that helps you write, express yourself and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple. BUILT FOR APPLE INTELLIGENCE — Apple Intelligence is the personal intelligence system that helps you write, express yourself and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: MaterialButton(onPressed: (){

                            },
                              color: AppColors.accentColor(),
                              textColor: AppColors.textColor(),
                              child: Icon(Icons.add_shopping_cart_outlined),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: MaterialButton(onPressed: (){

                            },
                              color: AppColors.accentColor(),
                              textColor: AppColors.textColor(),
                              child: Icon(Icons.shopping_bag_outlined),
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Similar Product",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 260,
                        child: Card(
                          elevation: 10,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 200, // Set a fixed width for each item
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  color: AppColors.dividerColor(),
                                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        products[index]['category'].toString(),
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Image.asset(
                                        'images/image_placeholder.jpg',
                                        height: 100, // Set a fixed height for the image
                                        width: double.infinity, // Scale the image to fit the width
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        products[index]['name'].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        products[index]['price'].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
          ),
        ),
      );
  }
}
