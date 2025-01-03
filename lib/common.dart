import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop_app/category.dart';
import 'package:online_shop_app/change_password.dart';
import 'package:online_shop_app/profile.dart';
import 'package:online_shop_app/wishlist.dart';

import 'cart.dart';
class AppColors
{
  static Color darkPrimary()
  {
    Color c = new Color(0xff0097a7); // Second `const` is optional in assignments.
    return c;
  }

  static Color lightPrimary()
  {
    Color c = new Color(0xffb2ebf2); // Second `const` is optional in assignments.
    return c;
  }

  static Color primary()
  {
    Color c = new Color(0xff00bcd4); // Second `const` is optional in assignments.
    return c;
  }

  static Color textColor()
  {
    Color c = new Color(0xffFFFFFF); // Second `const` is optional in assignments.
    return c;
  }

  static Color accentColor()
  {
    Color c = new Color(0xff607d8b); // Second `const` is optional in assignments.
    return c;
  }
  static Color accentColorTrans()
  {
    Color c = Color(0x80607d8b);
    return c;
  }
  static Color primaryText()
  {
    Color c = new Color(0xff212121); // Second `const` is optional in assignments.
    return c;
  }
  static Color secondaryText()
  {
    Color c = new Color(0xff757575); // Second `const` is optional in assignments.
    return c;
  }
  static Color dividerColor()
  {
    Color c = new Color(0xffBDBDBD); // Second `const` is optional in assignments.
    return c;
  }
  static Color inputBackground()
  {
    Color c = new Color(0xfff1f1f1); // Second `const` is optional in assignments.
    return c;
  }
  static Color cardBackground()
  {
    Color c = new Color(0xffF8F9FA); // Second `const` is optional in assignments.
    return c;
  }
  static Color productBackground()
  {
    Color c = new Color(0xffdef6f9); // Second `const` is optional in assignments.
    return c;
  }

}
class MyNavigationBar {
  static Widget getNavigationBar() {
    return NavigationBar(
      backgroundColor: Colors.white,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      selectedIndex: 0, // You can manage the active index dynamically
      onDestinationSelected: (int index) {
        switch (index) {
          case 0:
            print('Category should open');
            Get.to(() => Category());
            break;
          case 1:
            print('Search should open');
            // Navigate to search if required
            break;
          case 2:
            print('Profile should open');
            Get.to(() => Profile());
            break;
          case 3:
            print('Wishlist should open');
            Get.to(() => Wishlist());
            break;
          case 4:
            print('Cart should open');
            Get.to(() => Cart());
            break;
          default:
            break;
        }
      },
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.shopping_bag),
          label: 'Shop',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Commute',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
        NavigationDestination(
          icon: Icon(Icons.bookmark),
          label: 'Wishlist',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
    );
  }
}

class Base
{
   static String getBase()
   {
     return "https://theeasylearnacademy.com/shop/";
   }
   static String getAddress()
   {
     return getBase() + "ws/";
   }
   static String getImgAddress()
   {
     return getBase() + "images/";
   }
}
class Info
{
    static String CommonError = 'oops something went wrong, please try after sometime..';
    static void error(title,msg)
    {
      Get.snackbar(title,msg,
          snackPosition: SnackPosition.BOTTOM, // Position at the bottom
          backgroundColor: Colors.red.shade200, // Background color
          colorText: Colors.white, // Text color
          margin: const EdgeInsets.all(10), // Margin for the snackbar
          borderRadius: 8, // Rounded corners
          duration: const Duration(seconds:7));
    }
    static void message(title,msg)
    {
      Get.snackbar(title,msg,
          snackPosition: SnackPosition.BOTTOM, // Position at the bottom
          backgroundColor: Colors.green.shade200, // Background color
          colorText: Colors.white, // Text color
          margin: const EdgeInsets.all(10), // Margin for the snackbar
          borderRadius: 8, // Rounded corners
          duration: const Duration(seconds:7));
    }
}