import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(sliverExample());
}

class sliverExample extends StatelessWidget {
  final List<Map<String, String>> fruits = [
    {
      'name': 'Apple',
      'nutrition': '52 calories per 100g, high in fiber and Vitamin C',
      'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg',
    },
    {
      'name': 'Banana',
      'nutrition': '89 calories per 100g, rich in potassium and Vitamin B6',
      'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg',
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("First Example of Sliver"),
              leading: Icon(Icons.account_balance),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            fruits[index]['photoUrl'].toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          fruits[index]['name'].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
                childCount: fruits.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text(fruits[index]['name'].toString()),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(fruits[index]['photoUrl'].toString()),
                        ),
                        subtitle: Text(fruits[index]['nutrition'].toString()),
                      ),
                    ),
                  );
                },
                childCount: fruits.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
