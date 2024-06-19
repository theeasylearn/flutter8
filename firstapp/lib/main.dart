import 'package:flutter/material.dart';
void main() {
  StackDemo1 s1 = new StackDemo1();
  runApp(s1);
}
class MyContainer extends StatelessWidget {
  double height=0,width=0;
  Color color = Colors.black;
  MyContainer(double height, double width, Color color)
  {
      this.height = height;
      this.width = width;
      this.color = color;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        width: this.width,
        color: this.color,
    );
  }
}
class StackDemo1 extends StatelessWidget {
  const StackDemo1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Center(
            child: Stack(
                alignment: Alignment.center,
                children: [
                  MyContainer(200,200,Colors.red),
                  MyContainer(150,150,Colors.green),
                  MyContainer(100,100,Colors.yellow),
                ],
            ),
        ),
    );
  }
}

