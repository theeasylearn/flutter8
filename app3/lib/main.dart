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
                        height: parent.maxHeight * 0.80,
                        child: SingleChildScrollView(
                            child: Card(
                                elevation: 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                        readOnly: true,  // when true user cannot edit text
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(), //get today's date
                                            firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2101)
                                        );

                                        if(pickedDate != null ){
                                          print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                                          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                          print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                          //You can format date as per your need

                                          setState(() {
                                            dateController.text = formattedDate; //set foratted date to TextField value.
                                          });
                                        }else{
                                          print("Date is not selected");
                                        }
                                      },
                                    )
                                  ],
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
