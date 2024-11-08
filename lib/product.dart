import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';

class Product extends StatefulWidget {
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: MyNavigationBar.getNavigationBar(),
        body: Card(
          color: Colors.white,
          elevation: 10,
          child: CustomScrollView(
            slivers: [
                SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                    return Container(
                      color: AppColors.productBackground(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Mobile",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset('images/image_placeholder.jpg'),
                          SizedBox(height: 10),
                          Text(
                            "IPhone 16 pro max",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
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
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MaterialButton(onPressed: (){

                                },
                                  color: AppColors.accentColor(),
                                  textColor: AppColors.textColor(),
                                  child: Icon(Icons.add_shopping_cart_outlined),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                MaterialButton(onPressed: (){

                                },
                                  color: AppColors.accentColor(),
                                  textColor: AppColors.textColor(),
                                  child: Icon(Icons.shopping_bag_outlined),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                },
                childCount: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing:9,crossAxisSpacing: 9,
                  crossAxisCount: 2, childAspectRatio: 0.50,))
            ],
          )
        ),
      ),
    );
  }
}
