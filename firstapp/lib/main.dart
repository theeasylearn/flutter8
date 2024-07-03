import 'package:flutter/material.dart';
void main() {
  TableDemo td1 = new TableDemo();
  runApp(td1);
}
class TableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Table Demo",
        home:  Scaffold(
            appBar: AppBar(
                title: Text("Table Widget Demo"),
            ),
            body: Material(
                child: Table(
                    border: TableBorder.all(),
                    columnWidths: {
                      0: FractionColumnWidth(0.16),
                      1:FractionColumnWidth(0.14),
                      2:FractionColumnWidth(0.14),
                      3:FractionColumnWidth(0.14),
                      4:FractionColumnWidth(0.14),
                      5:FractionColumnWidth(0.14),
                      6:FractionColumnWidth(0.14),
                    },
                    children: [
                        TableRow(
                          children: [
                            Text("Time"),
                            Text("Mon"),
                            Text("Tue"),
                            Text("Wed"),
                            Text("Thu"),
                            Text("Fri"),
                            Text("Sat"),
                          ]
                        ),
                        TableRow(
                          children: [
                            Text("8 to 9"),
                            Text("c"),
                            Text("c"),
                            Text("c"),
                            Text("c++"),
                            Text("c++"),
                            Text("c++"),
                          ]
                        ),
                        TableRow(
                          children: [
                            Text("9 to 10"),
                            Text("dfs"),
                            Text("dfs"),
                            Text("dfs"),
                            Text("web"),
                            Text("web"),
                            Text("web"),
                          ]
                        ),
                        TableRow(
                          children: [
                            Text("10 to 11"),
                            Text("java"),
                            Text("java"),
                            Text("java"),
                            Text("os"),
                            Text("os"),
                            Text("os"),
                          ]
                        ),
                    ],
                ),
            ),
        ),
    );
  }
}
