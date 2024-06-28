import 'package:flutter/material.dart';
void main() {
  AspectRatio1 s1 = new AspectRatio1();
  runApp(s1);
}
class AspectRatio1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aspect Ratio example",
      home: Scaffold(
        appBar: AppBar(title: Text("Aspect ratio"),),
        body: Material(
          child: SizedBox(
            width:MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height/1.6,
            child: Card(
              elevation: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AspectRatio(
                    aspectRatio: 16/9,
                    child: Ink.image(
                      image: NetworkImage('https://picsum.photos/400/200'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text("India Vs England"),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}