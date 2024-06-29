import 'package:flutter/material.dart';
void main() {
  TableDemo td1 = new TableDemo();
  runApp(td1);
}
class TableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "World cup t20 match sechule",
      home: Scaffold(
        appBar: AppBar(
          title: Text("World cup t20 match sechule(india)"),
        ),
        body: Material(
          child: Table(
            border: TableBorder.all(color: Colors.red),
            columnWidths: {
              0: FractionColumnWidth(0.4),
              1: FractionColumnWidth(0.3),
              2: FractionColumnWidth(0.3)
            },
            children: [
              TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Match",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Date",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Venue",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    Text("India Vs England"),
                    Text("27-06-2024"),
                    Text("Barbados")
                  ]
              ),
              TableRow(
                  decoration: BoxDecoration(
                      color: Colors.limeAccent
                  ),
                  children: [
                    Text("India Vs South Afferic"),
                    Text("29-06-2024"),
                    Text("Guyana")
                  ]
              ),
              TableRow(
                  children: [
                    Text("India Vs Zimbabawe"),
                    Text("10-07-2024"),
                    Text("Harare")
                  ]
              ),
              TableRow(
                  decoration: BoxDecoration(
                      color: Colors.limeAccent
                  ),
                  children: [
                    Text("India Vs Sri lanka"),
                    Text("15-07-2024"),
                    Text("Colombo")
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}