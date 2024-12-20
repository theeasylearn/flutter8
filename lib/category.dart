import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop_app/common.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/product.dart';
class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int currentPageIndex = 0;
  var categories = []; //create empty list
  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    getCategories();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: MyNavigationBar.getNavigationBar(),
        body: Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Category",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (BuildContext ctx, int index)  {
                    return InkWell(
                      onTap: (){
                        Get.to(new Product(categories[index]['id'].toString()));
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.network(Base.getImgAddress() + 'category/' +
                                  categories[index]['photo'].toString()),
                              SizedBox(height: 10),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  categories[index]['title'].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getCategories() async
  {
      //used to fetch categories from server
      var apiAddress = Base.getAddress() + "category.php";
      Uri url = Uri.parse(apiAddress);
      //api call (fetch/submit data from api)
      var response = await http.get(url);
      print(response.statusCode);
      print(response.body);

      //convert response'body into json
      categories = json.decode(response.body);
      /*

      [
      0 {"error":"no"},
      1 {"total":6},
      2 {"id":"1","title":"laptop","photo":"laptop.jpg","islive":"1","isdeleted":"0"},
      3 {"id":"2","title":"mobile","photo":"mobile.jpg","islive":"1","isdeleted":"0"},
      4 {"id":"3","title":"book","photo":"books.jpg","islive":"1","isdeleted":"0"},
      5 {"id":"4","title":"Cookies & waffers","photo":"Cookies.jpg","islive":"1","isdeleted":"0"},
      6 {"id":"5","title":"Washing Powders","photo":"washing_powders.jpg","islive":"1","isdeleted":"0"},
      7 {"id":"6","title":"shampoo","photo":"shampoo.jpg","islive":"1","isdeleted":"0"}
      ]

       */
      //print error key from oth object
      String error = categories[0]['error'];
      print(error);
      int total = int.parse(categories[1]['total'].toString());
      //print total object
      print(total.toString());

      if(error !='no')
      {
          Get.snackbar('Error',error);
      }
      else
      {
          //check total
          if(total == 0)
          {
            Get.snackbar('Error','No categories found');
          }
          else
          {
            print("we have some categories to show");
            categories.removeAt(0);
            categories.removeAt(0);
            print(categories);
            //now just update view
            setState(() {

            });
          }
      }
  }
}
