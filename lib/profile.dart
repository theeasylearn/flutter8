import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop_app/common.dart';

import 'login.dart';

class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: Scaffold(
        bottomNavigationBar: MyNavigationBar.getNavigationBar(),
        appBar: AppBar(
          backgroundColor: AppColors.darkPrimary(),
          title: Text("Online Shop app"),
        ),
        body: Material(
          child: LayoutBuilder(builder: (context,parent){
            return(
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: parent.maxWidth,
                      child: CircleAvatar(
                          radius: 100,
                          child: Image.asset('images/profile.png'),
                      ),
                    ),
                    SizedBox(
                      width: parent.maxWidth,
                      height: parent.maxHeight * 0.50,
                      child: Padding(padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            TextButton(onPressed:(){}, child: Text("My Orders...",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),)),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(onPressed:(){}, child: Text("Change Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                ))),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(onPressed:(){
                              storage.delete(key: 'userid');
                              Get.off(() => Login());
                            }, child: Text("Logout",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                ))),
                          ],
                        ),),
                    ),

                  ],
                )
            );
          }),
        ),
      ),
    );
  }
}