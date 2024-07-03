import 'package:flutter/material.dart';
void main()
{
  AlignDemo ad1 = new AlignDemo();
  runApp(ad1);
}
class AlignDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.limeAccent,
      child: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Material(
            color: Colors.indigo,
            child: Align(
              alignment: Alignment(0,0),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


