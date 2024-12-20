import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  //create dynamic list
  var users = []; //empty list
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Example of networking...."),
        ),
        body: Material(
            child: ListView.builder(itemBuilder: (ctx,index){
                return (Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                            Icons.account_circle),
                      ),
                      title: Text(users[index]['name'].toString()),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(users[index]['email'].toString()),
                          Text(users[index]['username'].toString()),
                        ],
                      ),
                    ),
                  ),
                ));
            },itemCount: users.length,),
        ),
    );
  }

  Future<void> getUserInfo() async {
    String apiAddress = "jsonplaceholder.typicode.com";
    Uri url =  Uri.https(apiAddress, '/users');
    var response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    //covert it into json
    setState(() {
      users = json.decode(response.body);
    });
    print(users[0]['id']); // 1
    print(users[0]['name']); // Leanne Graham
    print(users[0]['username']); //Bret
  }
}
