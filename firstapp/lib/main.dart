import 'package:flutter/material.dart';
void main() {
  ProductDetail pd1 = new ProductDetail();
  runApp(pd1);
}
//test
class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
          color: Colors.white30,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                  Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          color: Colors.grey,
                          alignment: Alignment.center,
                          child: FlutterLogo(
                              size: 250,
                          ),
                      )
                  ),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: Text(
                              "Add to cart",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24
                            ),
                          ),
                      )
                  ),
              ],
            ),
          ),
      ),
    );
  }
}

