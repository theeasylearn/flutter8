import 'package:flutter/material.dart';

void main() {
  runApp(RowColumnDemo());
}

class RowColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: "Tic Tac game",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff002D72),
          title: Text("Tic tac game",style: TextStyle(
            color: Colors.white
          ),),
        ),
        body: Center(
          child: SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width / 2,
            child: Card(
              color: Color(0xffADD8E6),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 90,
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 90,
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 90,
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 90,
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 90,
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 90,
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 90,
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 90,
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 90,
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
