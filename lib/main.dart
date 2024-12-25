import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:online_shop_app/category.dart';
import 'package:online_shop_app/change_password.dart';
import 'package:online_shop_app/checkout.dart';
import 'package:online_shop_app/forgot_password.dart';
import 'package:online_shop_app/home.dart';
import 'package:online_shop_app/login.dart';
import 'package:online_shop_app/myorders.dart';
import 'package:online_shop_app/order_detail.dart';
import 'package:online_shop_app/product.dart';
import 'package:online_shop_app/product_detail.dart';
import 'package:online_shop_app/profile.dart';
import 'package:online_shop_app/register.dart';
import 'package:online_shop_app/user_demo.dart';
import 'package:online_shop_app/wishlist.dart';
import 'cart.dart';
void main() {
  // runApp(ProductDetail());
  runApp(GetMaterialApp(home: Register()));
}