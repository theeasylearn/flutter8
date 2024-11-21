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
          padding: const EdgeInsets.only(top:50,left: 10,right: 10),
          child: CustomScrollView(
              slivers: [
                SliverList(delegate: SliverChildBuilderDelegate((BuildContext ctx,int index){
                    return SizedBox(
                      height: 120,
                      child: Card(
                        color: AppColors.productBackground(),
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Use Flexible to manage layout constraints
                            Flexible(
                              child: Image.asset(
                                'images/image_placeholder.jpg',
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 200,
                              padding: EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("IPhone 15 pro max",
                                        style: TextStyle(
                                            fontSize: 16
                                        ),),
                                      Icon(
                                        Icons.delete,
                                        size: 24,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text("Rs 1500",
                                          style: TextStyle(
                                              fontSize: 16
                                          ),),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child:
                                        Icon(Icons.remove
                                        ),
                                      ),
                                      Expanded(
                                        child: Text("3",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,

                                          ),),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Icon(
                                            Icons.add
                                        ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                },
                childCount: 4))
              ],
          ),
        ),
      ),
    );
  }
}
