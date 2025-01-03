import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop_app/category.dart';
import 'package:online_shop_app/common.dart';
import 'package:http/http.dart' as http;

import 'home.dart';
class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = '', password = '';
  FlutterSecureStorage storage = new FlutterSecureStorage();
  @override
  void initState() {
    super.initState();

    // Listener for emailController
    emailController.addListener(() {
      if (emailController.text != null && emailController.text.isNotEmpty) {
        email = emailController.text.trim();
      }
    });

    // Listener for passwordController
    passwordController.addListener(() {
      if (passwordController.text != null && passwordController.text.isNotEmpty) {
        password = passwordController.text.trim();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkPrimary(),
          title: Text("Online Shop app"),
        ),
        body: Material(
          child: LayoutBuilder(builder: (context, parent) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: parent.maxWidth,
                  height: parent.maxHeight * 0.50,
                  child: Container(
                    alignment: Alignment.center,
                    color: AppColors.lightPrimary(),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ),
                SizedBox(
                  width: parent.maxWidth,
                  height: parent.maxHeight * 0.50,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Email Field
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0), // Optional: rounded border
                            ),
                            prefixIcon: Icon(Icons.email),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            fillColor: AppColors.inputBackground(),
                            filled: true,
                          ),
                        ),

                        // Password Field
                        TextField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0), // Optional: rounded border
                            ),
                            prefixIcon: Icon(Icons.lock),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            fillColor: AppColors.inputBackground(),
                            filled: true,
                          ),
                        ),

                        // Login Button
                        MaterialButton(
                          onPressed: () {
                            doLogin();
                          },
                          color: AppColors.accentColor(),
                          textColor: AppColors.textColor(),
                          child: Text("Sign in"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Future<void> doLogin() async {
    print("Email: $email, Password: $password");
    var apiAddress = "http://theeasylearnacademy.com/shop/ws/login.php";
    //[{"error":"input is missing"}] in case if inputs are missing

    //[{"error":"no"},{"success":"no"},{"message":"invalid login attempt"}] in case of wrong email and/or password
    //[{"error":"no"},{"success":"yes"},{"message":"login successful"},{"id":"51"}] in case of successful login
    Uri url = Uri.parse(apiAddress);
    HashMap<String,dynamic> form = new HashMap();
    form['email'] = email;
    form['password'] = password;
    var response = await http.post(url,body:form);
    print(response.body);
    try
    {
      var data = json.decode(response.body);
      String error = data[0]['error'];
      if(error != 'no') Info.error('error',error);
      else
      {
         String success = data[1]['success'];
         String message = data[2]['message'];
         if(success == 'no') Info.error('error', message);
         else
         {
            storage.write(key: 'userid', value: data[3]['id'].toString());
            Get.off(() => Category());
         }
      }
    }
    on Exception catch(error)
    {
      Info.error('error',Info.CommonError);
    }
  }
}
