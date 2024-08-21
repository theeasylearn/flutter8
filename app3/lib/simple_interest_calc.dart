import 'package:flutter/material.dart';

class SimpleInterestCalculator extends StatefulWidget {
  @override
  State<SimpleInterestCalculator> createState() =>
      _SimpleInterestCalculatorState();
}

class _SimpleInterestCalculatorState extends State<SimpleInterestCalculator> {
  TextEditingController amount = new TextEditingController();
  TextEditingController rate = new TextEditingController();
  TextEditingController year = new TextEditingController();

  double Amount=0.0,Rate=0.0,Year=0.0,Result=0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState method is called....");
    amount.addListener(() {
      if (amount.text.isNotEmpty) {
        Amount = double.parse(amount.text);
      }
    });

    rate.addListener(() {
      if (rate.text.isNotEmpty) {
        Rate = double.parse(rate.text);
      }
    });

    year.addListener(() {
      if (year.text.isNotEmpty) {
        Year = double.parse(year.text);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    print("build method is called....");
    return MaterialApp(
      title: "Simple Interest Calculator",
      home: Scaffold(
        resizeToAvoidBottomInset: true, // Ensures the layout resizes when the keyboard appears
        appBar: AppBar(
          title: Text("Simple Interest Calculator"),
        ),
        body: Material(
          color: Colors.white30,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: LayoutBuilder(builder: (context, parent) {
                return Center(
                  child: SizedBox(
                    height: parent.maxHeight * 0.70,
                    child: SingleChildScrollView(
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
                                child: Text(
                                  "Simple Interest Calculator",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: "sfpro"),
                                ),
                              ),
                              Text(
                                "Amount",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sfpro"),
                              ),
                              TextField(
                                controller: amount,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: new Color(0x75ffffff),
                                  filled:
                                  true, // Ensures the background color is applied
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black, // Black border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors
                                          .black, // Black border color when focused
                                      width: 1.0, // Border width when focused
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Rate",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sfpro"),
                              ),
                              TextField(
                                controller: rate,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: new Color(0x75ffffff),
                                  filled:
                                  true, // Ensures the background color is applied
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black, // Black border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors
                                          .black, // Black border color when focused
                                      width: 1.0, // Border width when focused
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Year",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sfpro"),
                              ),
                              TextField(
                                controller: year,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: new Color(0x75ffffff),
                                  filled:
                                  true, // Ensures the background color is applied
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black, // Black border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors
                                          .black, // Black border color when focused
                                      width: 1.0, // Border width when focused
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: parent.maxWidth,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        Result =  (Amount * Rate * Year) / 100;
                                        print("result = $Result");
                                      });
                                    },
                                    child: Text("Calculate Interest")),
                              ),
                              Text(Result.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sfpro"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}
