import 'package:flutter/material.dart';
void main() {
  SizedBoxDemo s1 = new SizedBoxDemo();
  runApp(s1);
}
class SizedBoxDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Holiday Package",
      home: Scaffold(
        appBar: AppBar(title: Text("Holiday Package"),),
        body: Material(
          child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Card(
                elevation: 6.0,
                color: Colors.white24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.deepPurple,
                        child: Text("Himaliyan Heights (6D/5N)", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Rs 55000"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Air Tickets, 5star Hotels, Meals"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("5 Activity, Veshnavdevi temple"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(onPressed: (){

                      }, child: Text("Book now")),
                    )
                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }
}



