import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';
import 'package:flutter_rating/flutter_rating.dart';
class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'images/image_placeholder.jpg',
                      height: 100, // Set a fixed height for the image
                      width: double.infinity, // Scale the image to fit the width
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text("IPhone 15 pro max"),
                                    Icon(Icons.delete,size: 32,)
                                ],
                              )
                          ],
                      ),
                    )
                  ],
              )
          ),
        ),
      ),
    );
  }
}
