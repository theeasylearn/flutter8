import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Bombarman());
}

class Bombarman extends StatefulWidget {
  @override
  State<Bombarman> createState() => _BombarmanState();
}

class _BombarmanState extends State<Bombarman> {
  // Initialize the list with the initial images
  List<String> buttonImages = List.generate(9, (index) => "images/gift_medium.png");
  List<int> list = List.filled(9, 0); // Initialize list with 9 zeros
  void generateRandomList() {
    Random random = Random();
    // Generate a random index for the one
    int index = random.nextInt(9);
    list[index] = 1;
    print("generateRandomList() method is called.....");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState() method is called.....");
    generateRandomList();
  }
  @override
  Widget build(BuildContext context) {
    print("build() method is called.....");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('3x3 Button Grid with Images'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRow(0),
                buildRow(3),
                buildRow(6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build a row of buttons
  Row buildRow(int startIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButton(startIndex),
        buildButton(startIndex + 1),
        buildButton(startIndex + 2),
      ],
    );
  }

  // Build a button with an image
  Widget buildButton(int index) {
    return MaterialButton(
      color: Colors.transparent,
      elevation: 0,
      highlightElevation: 0,
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          if (list[index] == 1)
          {
            buttonImages[index] = "images/explode_small.png";
          }
          else
          {
            buttonImages[index] = "images/win_small.png";
          }
        });
      },
      child: Image.asset(
        buttonImages[index],
        width: 100,
        height: 100,
      ),
    );
  }
}
