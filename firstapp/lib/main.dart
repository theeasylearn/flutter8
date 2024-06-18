import 'package:flutter/material.dart';

void main() {
  AlignDemo HomeScreen = new AlignDemo();
  runApp(HomeScreen);
}

class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Center(
        child: Container(
          height: 300,
          width: 300,
          padding: EdgeInsets.only(right: 10,top:50),
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: Align(
              alignment: Alignment(1,-1),
              child: FlutterLogo(
                size: 50,
              ),
          ),
        ),
      ),
    );
  }
}
