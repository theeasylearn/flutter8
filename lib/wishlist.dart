import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:online_shop_app/common.dart';
import 'package:http/http.dart' as http;
class Wishlist extends StatefulWidget {
  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  FlutterSecureStorage storage = new FlutterSecureStorage();
  var items = [];
  Widget showItem(int index) {
    return SizedBox(
      height: 250,
      child: LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints parent) {
          return Card(
            elevation: 10,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Image.network(
                    Base.getImgAddress() + "product/" + items[index]['photo'].toString(),
                    width: parent.maxWidth,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: AppColors.accentColorTrans(),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            items[index]['title'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rs " + items[index]['price'],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.delete,size: 22,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWishlistItem();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar.getNavigationBar(),
      body: Container(
        color: AppColors.textColor(),
        child: Padding(
          padding: const EdgeInsets.only(top:50,left: 10,right: 10),
          child: CustomScrollView(
            slivers: [
              SliverGrid(delegate: SliverChildBuilderDelegate(
                      (BuildContext ctx,int index) => showItem(index),
                      childCount: items.length
              ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getWishlistItem() async {
    storage.read(key: 'userid').then((userid) async {
        if(userid != null)
        {
          //[{"error":"input is missing"}] in case if input is not given
          //[{"error":"no"},{"total":2},{"id":"1","title":"Acer Laptop","price":"100","weight":"3000","size":"15 inch","photo":"acer.jpg","detail":"WINDOWS 10 4 GB DDR3 RAM 128 gb ssd hard disk"},{"id":"2","title":"dell laptop","price":"200","weight":"3500","size":"15 inch","photo":"dell.jpg","detail":"WINDOWS 10 8 GB DDR3 RAM 512 gb ssd hard disk"}]
          String apiAddress = Base.getAddress() + "wishlist.php?usersid=" + userid;
          print(apiAddress);
          var response = await http.get(Uri.parse(apiAddress));
          print(response.body);
          try
          {
              var data = json.decode(response.body);
              String error = data[0]['error'];
              if(error != 'no')
              {
                  Info.error('error',error);
              }
              else
              {
                  int total = data[1]['total'];
                  if(total!=0)
                  {
                     data.removeRange(0,2);
                     setState(() {
                        items = data;
                     });
                  }
              }
          }
          on Exception catch(error)
          {
            Info.error('error',Info.CommonError);
          }
        }
    });
  }
}
