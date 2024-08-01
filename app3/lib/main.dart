import 'package:flutter/material.dart';

void main() {
  runApp(ListViewExample1());
}
class ListViewExample1 extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text("Example of ListView"),
            ),
            body: GridView
              (
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                ),
                children: [
                    Card(elevation: 10,child: Image.network("https://picsum.photos/200?random=1"),),
                    Card(elevation: 10,child: Image.network("https://picsum.photos/200?random=2"),),
                    Card(elevation: 10,child: Image.network("https://picsum.photos/200?random=3"),),
                    Card(elevation: 10,child: Image.network("https://picsum.photos/200?random=4"),),
                    Card(elevation: 10,child: Image.network("https://picsum.photos/200?random=5"),),
                    Card(elevation: 10,child: Image.network("https://picsum.photos/200?random=6"),),
                ],
            )
          ),
      );
  }

}
