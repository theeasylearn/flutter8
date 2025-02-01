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
  TextEditingController productController = new TextEditingController();
  String ProductToSearch = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.addListener((){
        if (productController.text.trim() != '')
        {
            ProductToSearch = productController.text.trim();
        }
    });
  }
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: MyNavigationBar.getNavigationBar(),
        body: SizedBox(
          height: double.infinity,
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Column(
              children: [
                // Row takes 20% of the height
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8, // 80% of the space
                        child: TextFormField(
                          controller: productController,
                          decoration: InputDecoration(
                            hintText: 'Search for a product',  // Placeholder text
                            border: OutlineInputBorder(),      // Optional: adds a border to the TextField
                          ),
                            onFieldSubmitted: (value) {
                              // This is called when the user presses the "Enter" key on the keyboard
                              print('user want to search for ' + ProductToSearch);
                              SearchProductOnServer();
                            }
                        )
                        ,
                      ),
                      SizedBox(width: 10), // Optional spacing between the TextField and the button
                      Expanded(
                        flex: 2, // 20% of the space
                        child: ElevatedButton(
                          onPressed: () {
                            print('user want to search for ' + ProductToSearch);
                            SearchProductOnServer();
                          },
                          child: Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
                // showProducts takes 80% of the height
                Expanded(
                  child: showProducts(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

  Future<void> SearchProductOnServer() async {

     String apiAddress = Base.getAddress()  + "search_product.php?name=" + ProductToSearch;
     print(apiAddress);
     var response = await http.get(Uri.parse(apiAddress));
     print(response.body);
     try
         {
           var data = json.decode(response.body);
           String error = data[0]['error'];
           if(error == 'no')
           {
              int total = int.parse(data[1]['total'].toString());
              if (total == 0)
                {
                  Info.error('not found ', 'no such product ' + ProductToSearch);
                  products.clear();
                }
              else
              {
                 data.removeRange(0,2);
                 setState(() {
                    products = data;
                 });

              }
           }
         }
     on Exception catch(error)
     {
       Info.error('error',Info.CommonError);
     }
  }
}
