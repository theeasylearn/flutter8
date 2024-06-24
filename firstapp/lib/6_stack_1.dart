import 'package:flutter/material.dart';
void main() {
  StackDemo1 s1 = new StackDemo1();
  runApp(s1);
}
//test 3
class StackDemo1 extends StatelessWidget {
  const StackDemo1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.redAccent,
            ),
            Container(
              height: 150,
              width: 150,
              color: Colors.cyan,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}

