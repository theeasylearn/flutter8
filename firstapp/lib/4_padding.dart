import 'package:flutter/material.dart';

void main() {
  PaddingDemo HomeScreen = new PaddingDemo();
  runApp(HomeScreen);
}
class PaddingDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext ctx)
  {
    return MaterialApp(
      home: Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top:50,left: 100),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}
