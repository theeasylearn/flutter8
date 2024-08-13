import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  // sliverExample s1 = new sliverExample();
  var s1 = new sliverExample();
  //sliverExample() single use object
  runApp(s1);
}
class sliverExample extends StatelessWidget
{
  List<Map<String, String>> fruits = [
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
    {
      'name': 'Orange',
      'nutrition': '43 calories per 100g, high in Vitamin C and fiber',
      'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/9/9d/Orange-fruit.jpg',
    },
    {
      'name': 'Strawberry',
      'nutrition': '32 calories per 100g, rich in Vitamin C and antioxidants',
      'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Strawberries.jpg/1280px-Strawberries.jpg',
    },
    {
      'name': 'Grapes',
      'nutrition': '67 calories per 100g, high in vitamins and minerals',
      'photoUrl': 'https://picsum.photos/400?random=1',
    },
    {
      'name': 'Pineapple',
      'nutrition': '50 calories per 100g, high in Vitamin C and manganese',
      'photoUrl': 'https://picsum.photos/400?random=2',
    },
    {
      'name': 'Watermelon',
      'nutrition': '30 calories per 100g, high in Vitamin C and hydration',
      'photoUrl': 'https://picsum.photos/400?random=3',
    },
    {
      'name': 'Mango',
      'nutrition': '60 calories per 100g, rich in Vitamin A and C',
      'photoUrl': 'https://picsum.photos/400?random=4',
    },
    {
      'name': 'Papaya',
      'nutrition': '43 calories per 100g, high in Vitamin C and folate',
      'photoUrl': 'https://picsum.photos/400?random=5',
    },
    {
      'name': 'Kiwi',
      'nutrition': '61 calories per 100g, rich in Vitamin C and Vitamin K',
      'photoUrl': 'https://picsum.photos/400?random=6',
    },
    {
      'name': 'Blueberry',
      'nutrition': '57 calories per 100g, high in antioxidants and Vitamin C',
      'photoUrl': 'https://picsum.photos/400?random=7',
    },
    {
      'name': 'Pomegranate',
      'nutrition': '83 calories per 100g, high in Vitamin C and antioxidants',
      'photoUrl': 'https://picsum.photos/400?random=8',
    },
    // {
    //   'name': 'Pear',
    //   'nutrition': '57 calories per 100g, rich in fiber and Vitamin C',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Pear.jpg',
    // },
    // {
    //   'name': 'Peach',
    //   'nutrition': '39 calories per 100g, high in Vitamin C and Vitamin A',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Peach.jpg',
    // },
    // {
    //   'name': 'Plum',
    //   'nutrition': '46 calories per 100g, rich in Vitamin C and Vitamin K',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/5/5d/Plum.jpg',
    // },
    // {
    //   'name': 'Avocado',
    //   'nutrition': '160 calories per 100g, high in healthy fats and fiber',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/2/29/Avocado.jpg',
    // },
    // {
    //   'name': 'Cherry',
    //   'nutrition': '50 calories per 100g, rich in antioxidants and Vitamin C',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Cherry.jpg',
    // },
    // {
    //   'name': 'Lemon',
    //   'nutrition': '29 calories per 100g, high in Vitamin C and antioxidants',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Lemon.jpg',
    // },
    // {
    //   'name': 'Raspberry',
    //   'nutrition': '52 calories per 100g, rich in fiber and Vitamin C',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/6/68/Raspberry.jpg',
    // },
    // {
    //   'name': 'Coconut',
    //   'nutrition': '354 calories per 100g, high in healthy fats and fiber',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Coconut.jpg',
    // },
  ];
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          home: CustomScrollView(
            slivers: [
                SliverAppBar(
                  title: Text("first example of sliver"),
                  leading: Icon(Icons.account_balance),
                ),
                SliverGrid(delegate: SliverChildBuilderDelegate(
                    (context,index){
                        return Padding(
                            padding: EdgeInsets.all(10),
                            child: Card(
                              elevation: 10,
                              child: Column(
                                children: [
                                    Image.network("https://picsum.photos/400", fit: BoxFit.cover,),
                                    FittedBox(
                                      child: Text("Apple"),
                                    )
                                ],
                              ),
                            ),
                        );
                    },
                    childCount: 12
                ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3
                )),
                SliverList(delegate: SliverChildBuilderDelegate(
                    (context,index) {
                        return Padding(
                            padding: EdgeInsets.all(10),
                            child: Card(
                              elevation: 10,
                              child: ListTile(
                                  title: FittedBox(
                                      child: Text("Banana"),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage("https://picsum.photos/400"),
                                  ),
                                  subtitle: Text("Red and sweet keeps doctor away"),
                              ),
                            ),
                        );
                    },
                    childCount: 12
                ))
            ],
          ),
      );
  }
}