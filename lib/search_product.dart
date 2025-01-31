import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop_app/common.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/product_detail.dart';
class SearchProduct extends StatefulWidget {
  String categoryid='';

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  int currentPageIndex = 0;
  var products = []; //empty list
  String categoryid = '';
  FlutterSecureStorage storage = new FlutterSecureStorage();

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
            child: showProducts()
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

  Widget showProducts()
  {
    if(products.length > 0)
      return CustomScrollView(
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
                    FittedBox(
                      child: Text(
                        products[index]['categorytitle'].toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
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
                            String apiAddress = "add_to_cart.php";
                            ProcessRequest(apiAddress,products[index]['id'].toString());
                          },
                            color: AppColors.accentColor(),
                            textColor: AppColors.textColor(),
                            child: Icon(Icons.add_shopping_cart_outlined),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          MaterialButton(onPressed: (){
                            String apiAddress = "add_to_wishlist.php";
                            ProcessRequest(apiAddress,products[index]['id'].toString());
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
      );
    else
      return Center(child: Text("Sorry, no product found",
        style: TextStyle(
          fontSize: 40,

        ),
        textAlign: TextAlign.center,
      ));
  }

  Future<void> ProcessRequest(String apiAddress,String productid)
  async {
    //addtocart
    //[{"error":"input is missing"}] in case of input missing
    //https://theeasylearnacademy.com/shop/ws/add_to_cart.php?usersid=25&productid=2 when all inputs are given

    //addtowishlist
    //[{"error":"input is missing"}] in case of input missing
    //[{"error":"no"},{"message":"product added into wishlist"}] when all inputs are given
    storage.read(key: 'userid').then((userid) async {
      apiAddress = Base.getAddress() + apiAddress;
      Uri url = Uri.parse(apiAddress);
      HashMap<String,dynamic> form = new HashMap();
      form['usersid'] = userid;
      form['productid'] = productid;
      var response = await http.post(url,body: form);
      try
      {
        var data = json.decode(response.body);
        String error = data[0]['error'];
        if(error == 'no')
        {
          String message = data[1]['message'];
          Info.message('success',data[1]['message']);
        }
        else
        {
          Info.error('error',error);
        }
      }
      on Exception catch(error)
      {
        Info.error('error',Info.CommonError);
      }
    });

  }
}
