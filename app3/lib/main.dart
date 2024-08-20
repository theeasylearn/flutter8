import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'app_splash.dart';

void main() {
  runApp(ViewExpense());
}
class ViewExpense extends StatelessWidget {
  const ViewExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: new Color(0xffb2d4be),
        title: "View Income/Expense",
        home:  Scaffold(
          appBar: AppBar(
            title: Text("View Income Expense"),
            leading: Image.asset('images/app_icon.png'),
          ),
          body: Material(
            color: new Color(0xffb2d4be),
            child: CustomScrollView(
                slivers: [

                    SliverList(
                        delegate: SliverChildBuilderDelegate((context,index){
                        return Padding(
                          padding: EdgeInsets.only(left: 10,right: 10,bottom: 5),
                          child: (
                              Card(
                                  elevation: 10,
                                  child: ListTile(
                                      title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Book Expense", style: TextStyle(
                                              fontFamily: "sfpro"
                                            ),),
                                            Text("100",style: TextStyle(
                                                fontFamily: "sfpro",
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ],
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            Text("Maths book sem 5"),
                                            Row(
                                              children: [
                                                  Image.asset("images/edit.png"),
                                                  Image.asset("images/delete.png"),
                                              ],
                                            )
                                        ],
                                      ),
                                      leading: Image.asset('images/income.png'),
                                  ),
                              )
                          ),
                        );
                    }, childCount: 24),)
                ],
            ),
          ),
        ),
    );
  }
}

