import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';
class Checkout extends StatefulWidget {
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar.getNavigationBar(),
      body: Material(
        color: AppColors.textColor(),
        child: Padding(
          padding: const EdgeInsets.only(top:50,left: 10,right: 10),
          child: SingleChildScrollView(
               : Card(
                elevation: 10,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.account_circle),
                                    labelText: "fullname",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.accentColor(),
                                          strokeAlign:BorderSide.strokeAlignOutside
                                      )
                                    )
                              ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    labelText: "mobile",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.accentColor(),
                                          strokeAlign:BorderSide.strokeAlignOutside
                                      )
                                    )
                              ),
                          ),
                      ],
                    ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}
