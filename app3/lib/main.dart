import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(LayoutBuilderExample1());
}
class LayoutBuilderExample1 extends StatelessWidget {
  const LayoutBuilderExample1({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        title: "Layout builder example",
        home: Scaffold(
          appBar: AppBar(title: Text("Dashboard"),),
          body: LayoutBuilder(
              builder: (context,parent) {
                  return Column(
                      children: [
                          Row(
                              children: [
                                  Container(
                                      height: parent.maxHeight /3,
                                      width: parent.maxWidth /2,
                                      color: Colors.black12,
                                  ),
                                  Container(
                                      height: parent.maxHeight /3,
                                      width: parent.maxWidth /2,
                                      color: Colors.black26,
                                  ),
                              ],
                          ),
                        Row(
                          children: [
                            Container(
                              height: parent.maxHeight /3,
                              width: parent.maxWidth /2,
                              color: Colors.black26,
                            ),
                            Container(
                              height: parent.maxHeight /3,
                              width: parent.maxWidth /2,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: parent.maxHeight /3,
                              width: parent.maxWidth /2,
                              color: Colors.black12,
                            ),
                            Container(
                              height: parent.maxHeight /3,
                              width: parent.maxWidth /2,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ],
                  );
              },
          ),
        ),
     );
  }
}
