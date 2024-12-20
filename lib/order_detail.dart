import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';
import 'package:flutter_rating/flutter_rating.dart';
class MyOrderDetail extends StatefulWidget {
  @override
  State<MyOrderDetail> createState() => _MyOrderDetailState();
}

class _MyOrderDetailState extends State<MyOrderDetail> {
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
                      height: constraints.maxHeight * 0.20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Order Accepted",
                            style: TextStyle(
                                fontSize: 20
                            ),),
                          Text("Tue 03-dec-2024",
                            style: TextStyle(
                                fontSize: 20
                            ),),
                          Text("Rs 12500",
                            style: TextStyle(
                                fontSize: 20
                            ),)
                        ],
                      )
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.10,
                    child: Text("Item Details",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.70,
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
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text("IPhone 15 pro max",
                                          style: TextStyle(
                                              fontSize: 16
                                          ),),
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
                                              child: Text("3",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,

                                                ),),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              child: Text("Rs 4500",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,

                                                ),),
                                              flex: 2,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }, childCount: 3))
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
