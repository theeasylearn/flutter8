import 'package:flutter/material.dart';

void main() {
  BaseLineDemo b1 = new BaseLineDemo();
  runApp(b1);
}
class BaseLineDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        color: Colors.cyan,
        child: Center(
            child: Container(
              height: 150,
              width: 150,
              color: Colors.amberAccent,
              alignment: Alignment.topCenter,
              child: Baseline(
                baseline: 25,
                baselineType: TextBaseline.alphabetic,
                child: FlutterLogo(
                    size: 50,
                ),
              ),
            ),
        ),
      ),
    );
  }
}
