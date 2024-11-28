import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';
class Checkout extends StatefulWidget {
  @override
  State<Checkout> createState() => _CheckoutState();
}
enum PaymentMethod { none,cashOnDelivery, online }
  class _CheckoutState extends State<Checkout> {
  PaymentMethod selectedPaymentMethod = PaymentMethod.cashOnDelivery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar.getNavigationBar(),
      body: Material(
        color: AppColors.textColor(),
        child: Padding(
          padding: const EdgeInsets.only(top:50,left: 10,right: 10),
          child: SingleChildScrollView(
                child: Card(
                elevation: 10,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              keyboardType: TextInputType.phone,
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
                          SizedBox(
                          height: 10,
                          ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.pin_drop),
                              labelText: "Address Line 1",
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
                              prefixIcon: Icon(Icons.pin_drop),
                              labelText: "Address Line 2",
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
                              prefixIcon: Icon(Icons.pin_drop),
                              labelText: "City",
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.pin_drop),
                              labelText: "Pincode",
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
                              prefixIcon: Icon(Icons.keyboard),
                              labelText: "Remarks",
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
                        Text("Payment Method",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,

                        ),),
                        Column(
                          children: <Widget>[
                            RadioListTile<PaymentMethod>(
                              title: Text('Cash on delivery'),
                              value: PaymentMethod.cashOnDelivery,
                              groupValue: selectedPaymentMethod,
                              onChanged: (PaymentMethod? value) {
                                setState(() {
                                  selectedPaymentMethod = value!;
                                });
                              },
                            ),
                            RadioListTile<PaymentMethod>(
                              title: const Text('Online'),
                              value: PaymentMethod.online,
                              groupValue: selectedPaymentMethod,
                              onChanged: (PaymentMethod? value) {
                                setState(() {
                                  selectedPaymentMethod = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(onPressed: (){

                          },
                            color: AppColors.accentColor(),
                            textColor: AppColors.textColor(),
                            child: Text("Place Order"),
                          ),
                        )
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
