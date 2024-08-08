import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(ResponsiveDesign());
}
class ResponsiveDesign extends StatelessWidget {
  const ResponsiveDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Responsive Design Example"),
          ),
          body: LayoutBuilder(
              builder: (context,screen) {
                  if(screen.maxWidth>800)
                    return BigScreenDesign();
                  else
                    return MobileScreenDesign();

              },
          ),
        ),
    );
  }
}
class BigScreenDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
class MobileScreenDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
