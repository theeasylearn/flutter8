import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: Scaffold(
        body: Material(
          child: LayoutBuilder(builder: (context,parent){
            return(
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: parent.maxWidth,
                      height: parent.maxHeight * 0.50,
                      child: Stack(
                          children: [
                            Image.asset('images/shop_background.webp',
                            fit: BoxFit.cover,),
                            LayoutBuilder(builder: (context,box){
                                return (Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      height: box.maxHeight * 0.05,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset('images/logo_sm.png',height: 50,width: 50,),
                                        Text('Online shop',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25
                                          ),)
                                      ],
                                    ),
                                    SizedBox(
                                      height: box.maxHeight * 0.20,
                                    ),
                                    Text('Welcome',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 48
                                      ),),
                                    Text('Sign up or log in to access special discounts, '
                                        'add buy your favourite items',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                      ),)
                                  ],
                                ));
                            })
                          ],
                      ),
                    ),
                    SizedBox(
                      width: parent.maxWidth,
                      height: parent.maxHeight * 0.50,
                      child: Padding(padding: EdgeInsets.all(10),
                        child: Text('Hello')),
                    ),

                  ],
                )
            );
          }),
        ),
      ),
    );
  }
}