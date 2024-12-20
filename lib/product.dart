import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop_app/common.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/product_detail.dart';
class Product extends StatefulWidget {
  String categoryid='';
  Product(String categoryid)
  {
    this.categoryid = categoryid;
  }
  @override
  State<Product> createState() => _ProductState(categoryid);
}

class _ProductState extends State<Product> {
  int currentPageIndex = 0;
  var products = []; //empty list
  String categoryid = '';
  _ProductState(String categoryid)
  {
      this.categoryid = categoryid;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getProducts();
  }
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
                    return InkWell(
                      onTap: () {
                        String productid = products[index]['id'].toString();
                        Get.to(new ProductDetail(productid,categoryid));
                      },
                      child: Container(
                        color: AppColors.productBackground(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              products[index]['categorytitle'].toString(),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.network( Base.getImgAddress() +'product/'
                                +  products[index]['photo'].toString()),
                            SizedBox(height: 10),
                            Text(
                              products[index]['title'].toString(),
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
                      ),
                    );
                },
                childCount: products.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing:9,crossAxisSpacing: 9,
                  crossAxisCount: 2, childAspectRatio: 0.50,))
            ],
          )
        ),
      ),
    );
  }

  Future<void> getProducts()  async {
    String apiAddress = Base.getAddress() + "product.php?categoryid=" + this.categoryid;
    print(apiAddress);
    //convert into uri
    Uri url = Uri.parse(apiAddress);

    //api call to fetch data from servers
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);

    //convert into json
    products = json.decode(response.body);

    //check whether json is properly contructed or not
    String error = products[0]['error']; //store value of error key of 0th object into String variable error
    print(error);

    int total = int.parse(products[1]['total'].toString());
    print(total);
    //delete 2 objects
    products.removeRange(0,2);
    print(products);

    setState(() {

    });
  }
}
