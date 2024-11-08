import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: Scaffold(
        bottomNavigationBar: MyNavigationBar.getNavigationBar(),
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
                                      height: box.maxHeight * 0.10,
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
                                      height: box.maxHeight * 0.15,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MaterialButton(onPressed: (){

                            },
                              color: AppColors.darkPrimary(),
                              textColor: AppColors.textColor(),
                              child: Text("Sign in"),
                            ),
                            MaterialButton(onPressed: (){

                            },
                              color: AppColors.accentColor(),
                              textColor: AppColors.textColor(),
                              child: Text("Sign Up"),
                            )
                          ],
                        )),
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