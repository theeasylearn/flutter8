import 'dart:ui';

import 'package:flutter/material.dart';
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
class MyNavigationBar
{
  static Widget getNavigationBar()
  {
    return NavigationBar(
      backgroundColor: Colors.white,
      labelBehavior:  NavigationDestinationLabelBehavior.alwaysShow,
      selectedIndex: 0,
      onDestinationSelected: (int index) {

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
          selectedIcon: Icon(Icons.account_circle),
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