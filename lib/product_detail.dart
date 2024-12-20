import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:http/http.dart' as http;
class ProductDetail extends StatefulWidget {
  String productid = '',categoryid='';
  ProductDetail(productid,categoryid)
  {
    this.categoryid = categoryid;
    this.productid = productid;
  }
  @override
  State<ProductDetail> createState() => _ProductDetailState(productid,categoryid);
}

class _ProductDetailState extends State<ProductDetail> {
  int currentPageIndex = 0;

  var productList = [];
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
  var productDetail = [];
  var relatedProducts = [];
  String productid = '',categoryid='';

  _ProductDetailState(productid,categoryid)
  {
    this.categoryid = categoryid;
    this.productid = productid;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductDetail();
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
                        productDetail[0]['title'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rs" + productDetail[0]['price'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        productDetail[0]['stock'].toString() + " Left in stock",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        productDetail[0]['size'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        productDetail[0]['weight'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        productDetail[0]['categorytitle'].toString(),
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
                      Text(productDetail[0]['detail'],
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
                            itemCount: relatedProducts.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: SizedBox(
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
                                          relatedProducts[index]['category'].toString(),
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Image.network( Base.getImgAddress() +'product/'
                                        +  relatedProducts[index]['photo'].toString(),
                                          height: 100, // Set a fixed height for the image
                                          width: double.infinity, // Scale the image to fit the width
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          relatedProducts[index]['name'].toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          relatedProducts[index]['price'].toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
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

  Future<void> getProductDetail() async {

    String apiAddress = Base.getAddress() + "product.php?productid=" + this.productid;
    //convert into uri
    Uri url = Uri.parse(apiAddress);

    //api call to fetch data from servers
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);

    //convert into json
    productDetail = json.decode(response.body);

    //check whether json is properly contructed or not
    String error = productDetail[0]['error']; //store value of error key of 0th object into String variable error
    print(error);

    int total = int.parse(productDetail[1]['total'].toString());
    print(total);
    //delete 2 objects
    productDetail.removeRange(0,2);
    print(productDetail);
    productList.add(Base.getImgAddress() + "product/" + productDetail[0]['photo'].toString());

    setState(() {

    });
    getRelatedProducts();
  }

  Future<void> getRelatedProducts() async {
    String apiAddress = Base.getAddress() + "product.php?categoryid=" + this.categoryid;
    print(apiAddress);
    //convert into uri
    Uri url = Uri.parse(apiAddress);

    //api call to fetch data from servers
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);

    //convert into json
    relatedProducts = json.decode(response.body);

    //check whether json is properly contructed or not
    String error = relatedProducts[0]['error']; //store value of error key of 0th object into String variable error
    print(error);

    int total = int.parse(relatedProducts[1]['total'].toString());
    print(total);
    //delete 2 objects
    relatedProducts.removeRange(0,2);
    print(relatedProducts);
    setState(() {

    });
  }
}
