import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';
class Checkout extends StatefulWidget {
  @override
  State<Checkout> createState() => _CheckoutState();
}

enum PaymentMethod { none, cashOnDelivery, online }

class _CheckoutState extends State<Checkout> {
  // TextEditingControllers
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  // String variables
  String fullName = '';
  String mobile = '';
  String addressLine1 = '';
  String addressLine2 = '';
  String city = '';
  String pincode = '';
  String remarks = '';

  PaymentMethod selectedPaymentMethod = PaymentMethod.cashOnDelivery;

  @override
  void initState() {
    super.initState();

    // Add listeners to update string variables
    fullNameController.addListener(() {
      fullName = fullNameController.text.trim();
    });

    mobileController.addListener(() {
      mobile = mobileController.text.trim();
    });

    addressLine1Controller.addListener(() {
      addressLine1 = addressLine1Controller.text.trim();
    });

    addressLine2Controller.addListener(() {
      addressLine2 = addressLine2Controller.text.trim();
    });

    cityController.addListener(() {
      city = cityController.text.trim();
    });

    pincodeController.addListener(() {
      pincode = pincodeController.text.trim();
    });

    remarksController.addListener(() {
      remarks = remarksController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar.getNavigationBar(),
      body: Material(
        color: AppColors.textColor(),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Full Name
                    TextField(
                      controller: fullNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: "Full Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.accentColor(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Mobile
                    TextField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: "Mobile",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.accentColor(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Address Line 1
                    TextField(
                      controller: addressLine1Controller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.pin_drop),
                        labelText: "Address Line 1",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.accentColor(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Address Line 2
                    TextField(
                      controller: addressLine2Controller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.pin_drop),
                        labelText: "Address Line 2",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.accentColor(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // City
                    TextField(
                      controller: cityController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.pin_drop),
                        labelText: "City",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.accentColor(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Pincode
                    TextField(
                      controller: pincodeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.pin_drop),
                        labelText: "Pincode",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.accentColor(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Remarks
                    TextField(
                      controller: remarksController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.keyboard),
                        labelText: "Remarks",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.accentColor(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Payment Method
                    Text(
                      "Payment Method",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                          title: Text('Online'),
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
                      child: MaterialButton(
                        onPressed: () {
                          placeOrder();
                        },
                        color: AppColors.accentColor(),
                        textColor: AppColors.textColor(),
                        child: Text("Place Order"),
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

  void placeOrder() {
    print("Full Name: $fullName");
    print("Mobile: $mobile");
    print("Address Line 1: $addressLine1");
    print("Address Line 2: $addressLine2");
    print("City: $city");
    print("Pincode: $pincode");
    print("Remarks: $remarks");
    print("Payment Method: ${selectedPaymentMethod == PaymentMethod.cashOnDelivery ? 'Cash on Delivery' : 'Online'}");
  }
}
