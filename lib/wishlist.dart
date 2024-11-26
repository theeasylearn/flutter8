import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';
class Wishlist extends StatefulWidget {
  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  Widget showItem() {
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
                  child: Image.asset(
                    'images/image_placeholder.jpg',
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
                            "IPhone 16 Pro Max",
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
                              "Rs 125000",
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
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar.getNavigationBar(),
      body: Material(
        color: AppColors.textColor(),
        child: Padding(
          padding: const EdgeInsets.only(top:50,left: 10,right: 10),
          child: CustomScrollView(
            slivers: [
              SliverGrid(delegate: SliverChildBuilderDelegate(
                      (BuildContext ctx,int index) => showItem(),
                      childCount: 12
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
}
