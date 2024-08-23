import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'app_splash.dart';
import 'app_view_expense.dart';
import 'simple_interest_calc.dart';
import 'package:intl/intl.dart';

//https://github.com/nbnD/date_picker/blob/master/lib/homepage.dart
void main() {
  runApp(AddTransaction());
}
class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController dateController = new TextEditingController();

  String SelectedValue = '1';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Income/Expense app",
        home: Scaffold(
            appBar: AppBar(
                title: Text("Add Entry"),
            ),
            body: Material(
              color: new Color(0xffb2d4be),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: LayoutBuilder(builder: (ctx,parent){
                    return SizedBox(
                        height: parent.maxHeight,
                        child: SingleChildScrollView(
                            child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          "Add Entry",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                              fontFamily: "sfpro"),
                                        ),
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.text,
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
                                      TextField(
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
                                      TextField(
                                        controller: dateController, //editing controller of this TextField
                                        decoration: const InputDecoration(
                                            icon: Icon(Icons.calendar_today), //icon of text field
                                            labelText: "Enter Date" //label text of field
                                        ),
                                        onTap: () async {
                                          DateTime? pickedDate = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(), //get today's date
                                              firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                              lastDate: DateTime(2101)
                                          );

                                          if (pickedDate != null) {
                                            String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                            setState(() {
                                              dateController.text = formattedDate; //set formatted date to TextField value.
                                            });
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.text,
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
                                      Text("Mode of entry"),
                                      ListTile(
                                        title: Text('Income'),
                                        leading: Radio(
                                          value: '2',
                                          groupValue: SelectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              SelectedValue = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Text('Expense'),
                                        leading: Radio(
                                          value: '1',
                                          groupValue: SelectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              SelectedValue = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: parent.maxWidth,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {

                                              });
                                            },
                                            child: Text("Add Entry")),
                                      ),
                                    ],
                                  ),
                                ),
                            ),
                        ),
                    );
                }),
              ),
            ),
        ),
    );
  }
}
