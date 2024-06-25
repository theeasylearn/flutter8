import 'package:flutter/material.dart';
void main() {
  CardExample c1 = new CardExample();
  runApp(c1);
}
class Team extends StatelessWidget
{
  String TeamName='', Players='';
  Team(String TeamName, String Players)
  {
      this.TeamName = TeamName;
      this.Players = Players;
  }
    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          leading: Icon(Icons.account_circle_rounded, size: 48,),
          title: Text(this.TeamName,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.blueAccent
          ),),
          subtitle: Text(this.Players),
        ),
      ),
    );
  }
}
class CardExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text("Card Example"),),
            body: Material(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Team("India","Rohit Sharma (c), Virat Kohli, Bumrah"),
                    Team("England","Buttler, Baristo, Archar, Livingstone"),
                    Team("South Afferica","Henry Klassan, De Cock, Rabada"),
                    Team("Afghanistan","rashid khan, Gurbaz, Nabi"),
                  ],
                ),
            ),
          ),
      );
  }
}


