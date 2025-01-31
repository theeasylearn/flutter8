import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop_app/checkout.dart';
import 'package:online_shop_app/common.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:http/http.dart' as http;

import 'category.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  //declare secure storage type object
  FlutterSecureStorage storage = new FlutterSecureStorage();
  //create list to store cart items data
  var cartItems = []; //empty list
  int cartTotal = 0;
  //Override initstate method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //call getCartItems method
    getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar.getNavigationBar(),
      body: Container(
        color: AppColors.textColor(),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.80,
                    child: displayItem(),
                  ),
                  Container(
                    color: AppColors.productBackground(),
                    child: SizedBox(
                        height: constraints.maxHeight * 0.10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total"),
                            Text("Rs" + cartTotal.toString()),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.10,
                    child: Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      width: constraints.maxWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: AppColors.textColor(),
                            backgroundColor: AppColors.accentColor()),
                        onPressed: () {
                          if(cartItems.length>0)
                          {
                              print("we can use Checkout");
                              Get.to(() => Checkout());
                          }
                        },
                        child: Text("Proceed to checkout"),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void getCartItems() {
    //get value of cart key from storage
    storage.read(key: 'userid').then((userid) async {
      if (userid != null) {
        //call api
        //[{"error":"input is missing"}] in case if input is not given
        //[{"error":"no"},{"total":0}] if cart is empty
        //[
        // {"error":"no"},
        // {"total":2},
        // {"id":"1","cartid":"157","title":"Acer Laptop","price":"100","quantity":"3","weight":"3000","size":"15 inch","photo":"acer.jpg","detail":"WINDOWS 10 4 GB DDR3 RAM 128 gb ssd hard disk"},
        // {"id":"2","cartid":"158","title":"dell laptop","price":"200","quantity":"4","weight":"3500","size":"15 inch","photo":"dell.jpg","detail":"WINDOWS 10 8 GB DDR3 RAM 512 gb ssd hard disk"}]
        String apiAddress = "cart.php?usersid=" + userid;
        print(apiAddress);
        //convert into uri
        Uri uri = Uri.parse(Base.getAddress() + apiAddress);
        //call get method
        var response = await http.get(uri);
        print(response.body);
        try {
          var data = json.decode(response.body);
          String error = data[0]['error'];
          if (error != 'no')
            Info.error('error', error);
          else {
            int total = data[1]['total'];
            //delete first 2 items
            data.removeRange(0, 2);
            if (total != 0) {
              //calculates
              int price = 0;
              int quantity = 0;
              int itemTotal = 0;
              for (int position = 0; position < data.length; position++) {
                quantity = int.parse(data[position]['quantity'].toString());
                price = int.parse(data[position]['price'].toString());
                itemTotal = price * quantity;
                cartTotal += itemTotal;
              }
            }
            setState(() {
              print('we are here');
              cartItems = data;
            });
          }
        } on Exception catch (error) {
          print(error);
          Info.error('error', Info.CommonError);
        }
      }
    });
  }

  Future<void> deleteFromCart(cart, index) async {
    String apiAddress =
        Base.getAddress() + "delete_from_cart.php?cartid=" + cart['cartid'];
    CallApi(cart, apiAddress, index);
  }

  Widget displayItem() {
    if (cartItems.length == 0) {
      return Center(
        child: Image.asset('images/empty_cart.png'),
      );
    } else {
      return CustomScrollView(
        slivers: [
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext ctx, int index) {
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
                      child: Image.network(
                        Base.getImgAddress() +
                            "product/" +
                            cartItems[index]['photo'],
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
                              Text(
                                cartItems[index]['title'],
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print('hello');
                                      moveToWishlist(cartItems[index], index);
                                    },
                                    child: Icon(
                                      Icons.heart_broken,
                                      size: 24,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      deleteFromCart(cartItems[index], index);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "Rs " + cartItems[index]['price'],
                                  style: TextStyle(fontSize: 16),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                    onTap: () {
                                      print("minus button clicked...");
                                      if(int.parse(cartItems[index]['quantity'].toString())>1)
                                      {
                                        updateCart(cartItems[index], "minus", index);
                                      }
                                    },
                                    child: Icon(Icons.remove)),
                              ),
                              Expanded(
                                child: Text(
                                  cartItems[index]['quantity'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                    onTap: () {
                                      print("plus button clicked...");
                                      updateCart(
                                          cartItems[index], "plus", index);
                                    },
                                    child: Icon(Icons.add)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }, childCount: cartItems.length))
        ],
      );
    }
  }

  void moveToWishlist(cartItem, int index) {
    storage.read(key: 'userid').then((userid) {
      String apiAddress = Base.getAddress() +
          "move_to_wishlist.php?usersid=" +
          userid.toString() +
          "&productid=" +
          cartItem['id'].toString();
      CallApi(cartItem, apiAddress, index);
      print(apiAddress);
    });
  }

  Future<void> CallApi(cart, apiAddress, index) async {
    Uri url = Uri.parse(apiAddress);
    var response = await http.get(url);
    print(response.body);
    try {
      var data = json.decode(response.body);
      String error = data[0]['error'];
      if (error != 'no')
        Info.error('error', error);
      else {
        Info.message('success', data[1]['message']);
        setState(() {
          int tempTotal =
              int.parse(cart['price']) * int.parse(cart['quantity']);
          cartTotal = cartTotal - tempTotal;
          cartItems.removeAt(index);
        });
      }
    } on Exception catch (error) {
      Info.error('error', Info.CommonError);
    }
  }

  Future<void> updateCart(cartItem, String mode, int index) async {
    print(mode);
    //print(cartItem);
    String apiAddress = "";
    storage.read(key: 'userid').then((userid) async {
    if (mode == "plus") {
        apiAddress = Base.getAddress() + "add_to_cart.php?productid=" + cartItems[index]['id'].toString()
            + "&usersid=" + userid.toString();
  } else {
    apiAddress = Base.getAddress() + "add_to_cart.php?productid="
        + cartItems[index]['id'].toString() + "&usersid=" + userid.toString() + "&mode=minus";
    }
    print(apiAddress);

    Uri url = Uri.parse(apiAddress);
    var response = await http.get(url);

    try {
      var data = json.decode(response.body);
      String error = data[0]['error'];
      if (error != 'no')
        Info.error('error', error);
      else {
        Info.message('success', data[1]['message']);
        setState(() {
          if (mode == "plus") {
            cartTotal = cartTotal + int.parse(cartItem['price'].toString());
            cartItems[index]['quantity'] = (int.parse(cartItems[index]['quantity'].toString()) + 1).toString();
          } else {

              cartTotal = cartTotal - int.parse(cartItem['price'].toString());
              cartItems[index]['quantity'] = (int.parse(cartItems[index]['quantity'].toString()) - 1).toString();

          }
        });
      }
    } on Exception catch (error) {
      Info.error('error', Info.CommonError);
    }
    });
  }
}
