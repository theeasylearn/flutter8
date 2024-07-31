import 'package:flutter/material.dart';

void main() {
  runApp(ListViewExample1());
}
class ListViewExample1 extends StatelessWidget
{
  List<Map<String, String>> cricketTeams = [
    {
      "teamName": "India",
      "captainName": "Rohit Sharma",
      "flagUrl": "https://flagpedia.net/data/flags/h80/in.png"
    },
    {
      "teamName": "Australia",
      "captainName": "Aaron Finch",
      "flagUrl": "https://flagpedia.net/data/flags/h80/au.png"
    },
    {
      "teamName": "England",
      "captainName": "Jos Buttler",
      "flagUrl": "https://flagpedia.net/data/flags/h80/gb.png"
    },
    {
      "teamName": "New Zealand",
      "captainName": "Kane Williamson",
      "flagUrl": "https://flagpedia.net/data/flags/h80/nz.png"
    },
    {
      "teamName": "South Africa",
      "captainName": "Temba Bavuma",
      "flagUrl": "https://flagpedia.net/data/flags/h80/za.png"
    },
    {
      "teamName": "Pakistan",
      "captainName": "Babar Azam",
      "flagUrl": "https://flagpedia.net/data/flags/h80/pk.png"
    },
    {
      "teamName": "West Indies",
      "captainName": "Kieron Pollard",
      "flagUrl": "https://flagpedia.net/data/flags/h80/wi.png"
    },
    {
      "teamName": "Sri Lanka",
      "captainName": "Dasun Shanaka",
      "flagUrl": "https://flagpedia.net/data/flags/h80/lk.png"
    },
    {
      "teamName": "Bangladesh",
      "captainName": "Mahmudullah",
      "flagUrl": "https://flagpedia.net/data/flags/h80/bd.png"
    },
    {
      "teamName": "Afghanistan",
      "captainName": "Mohammad Nabi",
      "flagUrl": "https://flagpedia.net/data/flags/h80/af.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text("Example of ListView"),
            ),
            body: ListView.builder(
                itemCount: cricketTeams.length,
                itemBuilder: (context,index)  {
                  return Card(
                    child: ListTile(
                      title: Text(cricketTeams[index]['teamName'].toString(),style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),),
                      subtitle: Text(cricketTeams[index]['captainName'].toString(),style: TextStyle(
                        fontSize: 15,
                      ),),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(cricketTeams[index]['flagUrl'].toString()),
                      ),
                    ),
                  );
                })
          ),
      );
  }

}
