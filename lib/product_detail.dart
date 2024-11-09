import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: MyNavigationBar.getNavigationBar(),
        body: Material(
          color: AppColors.textColor(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                color: AppColors.productBackground(),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(child: Image.asset('images/image_placeholder.jpg')),
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
                        )
                      ],
                    ),
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}
