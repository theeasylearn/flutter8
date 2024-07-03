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
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Positioned(
                    left: 0,
                    top:0,
                    child: FlutterLogo(
                      size: 50,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: FlutterLogo(
                      size: 50,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: FlutterLogo(
                      size: 50,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: FlutterLogo(
                      size: 50,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


