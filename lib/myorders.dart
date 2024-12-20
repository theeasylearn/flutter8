import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';
import 'package:flutter_rating/flutter_rating.dart';
class MyOrders extends StatefulWidget {
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar.getNavigationBar(),
      body: Material(
        color: AppColors.textColor(),
        child: Padding(
          padding: const EdgeInsets.only(top:50,left: 10,right: 10),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: constraints.maxHeight,
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
                                      'images/order.png',
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text("Order Accepted",
                                          style: TextStyle(
                                              fontSize: 16
                                          ),),
                                        Text("Tue 03-dec-2024",
                                          style: TextStyle(
                                              fontSize: 16
                                          ),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text("Rs 12500",
                                                style: TextStyle(
                                                    fontSize: 16
                                                ),),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              child: Text("3",
                                                style: TextStyle(
                                                    fontSize: 16
                                                ),),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              child: Text("Rs 37500",
                                                style: TextStyle(
                                                    fontSize: 16
                                                ),),
                                              flex: 1,
                                            ),
                                          ],
                                        ),
                                        Text("No of Items: 12",
                                          style: TextStyle(
                                              fontSize: 16
                                          ),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }, childCount: 6))
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
