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
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/store.png",fit: BoxFit.fill,),
                                ),
                              ),
                              Text("Shop",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      height: parent.maxHeight /3,
                      width: parent.maxWidth /2,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/cart.png",fit: BoxFit.fill,),
                                ),
                              ),
                              Text("cart",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: parent.maxHeight /3,
                      width: parent.maxWidth /2,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/heart.png",fit: BoxFit.fill,),
                                ),
                              ),
                              Text("Wishlist",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      height: parent.maxHeight /3,
                      width: parent.maxWidth /2,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/history.png",fit: BoxFit.fill,),
                                ),
                              ),
                              Text("History",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: parent.maxHeight /3,
                      width: parent.maxWidth /2,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/settings.png",fit: BoxFit.fill,),
                                ),
                              ),
                              Text("Change Password",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      height: parent.maxHeight /3,
                      width: parent.maxWidth /2,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/logout.png",fit: BoxFit.fill,),
                                ),
                              ),
                              Text("Logout",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
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
