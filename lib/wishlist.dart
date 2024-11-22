import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';
import 'package:flutter_rating/flutter_rating.dart';
class Wishlist extends StatefulWidget {
  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar.getNavigationBar(),
      body: Material(
        color: AppColors.textColor(),
        child: Padding(
          padding: const EdgeInsets.only(top:50,left: 10,right: 10),
          child: SizedBox(
              height: 200,
              child: Card(
                elevation: 10,
                child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Image.asset(
                      'images/image_placeholder.jpg',
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      child:
                      Container(
                        color: AppColors.accentColor(),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "IPhone 16 pro max",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            Text(
                                "Rs 125000",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
                                ),
              ),
          ),
        ),
      ),
    );
  }
}
