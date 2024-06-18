import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 200,
          color: Colors.blueAccent,
          child: Text("the easylearn academy",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
