import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'app_splash.dart';
import 'app_view_expense.dart';

void main() {
  runApp(SimpleInterestCalculator());
}
class SimpleInterestCalculator extends StatefulWidget {

  @override
  State<SimpleInterestCalculator> createState() => _SimpleInterestCalculatorState();
}

class _SimpleInterestCalculatorState extends State<SimpleInterestCalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Simple Interest Calculator",
        home: Scaffold(
            appBar: AppBar(
                title: Text("Simple Interest Calculator"),
            ),
            body: Material(
                color: Colors.white30,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: LayoutBuilder(builder: (context,parent) {
                      return Center(
                        child: SizedBox(
                          height: parent.maxHeight * 0.70,
                          child: Card(
                            elevation: 10,
                            color: Colors.white70,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FittedBox(
                                    child: Text("Simple Interest Calculator",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        fontFamily: "sfpro"
                                    ),),
                                  ),
                                  Text("Amount",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "sfpro"
                                  ),),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                    ),
                                  ),

                                  Text("Rate",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "sfpro"
                                  ),),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                    ),
                                  ),

                                  Text("Year",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "sfpro"
                                  ),),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                    ),
                                  ),

                                  SizedBox(
                                    width: parent.maxWidth,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Calculate Interest")
                                    ),
                                  ),
                                  Text("Result",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "sfpro"
                                  ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                  })
                ),
            ),
        ),
    );
  }
}



