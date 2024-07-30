import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Bombarman());
}

class Bombarman extends StatefulWidget {
  @override
  // State<Bombarman> createState() => _BombarmanState();
  State<Bombarman> createState() {
    _BombarmanState b1 = new _BombarmanState();
    return b1;
  }
}

class _BombarmanState extends State<Bombarman> {
  // Initialize the list with the initial images
  List<String> buttonImages =
      List.generate(9, (index) => "images/gift_medium.png");
  List<int> list = List.filled(9, 0); // Initialize list with 9 zeros
  bool isPlaying = false;
  bool isGameOver = false;
  String message = "";
  int coins = 100;
  int round = 0;

  String ButtonLabel = "";
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
    playBackgroundMusic();
  }
  void playBackgroundMusic() {
    //await _audioPlayer.play(AssetSource('sound/lost.mp3'));
    //isPlaying = true;
    AssetsAudioPlayer.newPlayer().open(
      Audio("sound/game.mp3"),
      autoStart: true,
    );
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
                Text(
                  message,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 36, color: Colors.red),
                ),
                buildRow(0),
                buildRow(3),
                buildRow(6),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    child: Text(ButtonLabel),
                    color: Colors.indigo,
                    textColor: Colors.white,
                    onPressed: () {
                      if (isGameOver == true) {
                        setState(() {
                          ButtonLabel = "";
                          isGameOver = false;
                          round = 0;
                          coins = 100;
                          message = "";
                          buttonImages =
                              List.generate(9, (index) => "images/gift_medium.png");
                          generateRandomList();
                        });
                      }
                      if (round >= 2) {
                        setState(() {
                          isGameOver = true;
                          message =
                              "Congraulation, you win " + coins.toString();
                          round = 0;
                          ButtonLabel = "start game";
                        });
                      }

                      print("quit button clicked");
                    },
                  ),
                ),
                Text(
                  "your coins = " + coins.toString(),
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                ),
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
          if (isGameOver == false) {
            round++;
            if (round >= 1) {
              setState(() {
                ButtonLabel = "I want to quit";
              });
            }
            if (list[index] == 1) {
              buttonImages[index] = "images/explode_small.png";
              isGameOver = true;
              message = "Game Over";
              coins = 0;
            } else {
              buttonImages[index] = "images/win_small.png";
              coins = coins * 2;
              if (round == 8) {
                isGameOver = false;
                message = "you won";
              }
            }
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
