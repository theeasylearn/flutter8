import 'package:flutter/material.dart';
void main()
{
  WrapDemo wd1 = WrapDemo();
  runApp(wd1);
}
class WrapDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "World cup t20 match schedule",
        home: Scaffold(
            appBar: AppBar(
              title: Text("World cup t20 match schedule(india)"),
            ),
            body: Material(
              child: Wrap(
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2,
                    child: Ink.image(
                      image: NetworkImage("https://picsum.photos/600?random=1"),
                      fit: BoxFit.cover,),
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2,
                    child: Ink.image(
                      image: NetworkImage("https://picsum.photos/600?random=2"),
                      fit: BoxFit.cover,),
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2,
                    child: Ink.image(
                      image: NetworkImage("https://picsum.photos/600?random=3"),
                      fit: BoxFit.cover,),
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2,
                    child: Ink.image(
                      image: NetworkImage("https://picsum.photos/600?random=4"),
                      fit: BoxFit.cover,),
                  ),
                ],
              ),
            )
        )
    );
  }
}