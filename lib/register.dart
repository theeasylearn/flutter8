import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop_app/common.dart';
import 'package:http/http.dart' as http;

import 'login.dart';
class Register extends StatefulWidget {

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  String email='',password='',mobile='',confirmPassword='';

  FlutterSecureStorage storage = new FlutterSecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener((){
        if(emailController.text != null && emailController.text.length !=0)
        {
            email = emailController.text.trim();
        }
    });
    passwordController.addListener((){
      if(passwordController.text != null && passwordController.text.length !=0)
      {
        password = passwordController.text.trim();
      }
    });
    confirmPasswordController.addListener((){
      if(confirmPasswordController.text != null && confirmPasswordController.text.length !=0)
      {
        confirmPassword = confirmPasswordController.text.trim();
      }
    });
    mobileController.addListener((){
      if(mobileController.text != null && mobileController.text.length !=0)
      {
        mobile = mobileController.text.trim();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Register",
        debugShowCheckedModeBanner: false, // Removes the debug banner
        home: Scaffold(
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
                                    width: parent.maxWidth,
                                    height: parent.maxHeight * 0.25,
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: AppColors.lightPrimary(),
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                          fontSize: 48
                                        ),
                                      ),
                                    ),
                                ),
                                SizedBox(
                                  width: parent.maxWidth,
                                  height: parent.maxHeight * 0.75,
                                  child: Padding(padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      TextField(
                                        controller: emailController,
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: new InputDecoration(
                                            labelText: 'email',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0), // Optional: rounded border
                                          ),
                                          prefixIcon: Icon(Icons.email),
                                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                          fillColor: AppColors.inputBackground(), filled: true
                                        ),

                                      ),
                                      // Mobile Number Field
                                      TextField(
                                        controller: mobileController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'mobile',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0), // Optional: rounded border
                                          ),
                                          prefixIcon: Icon(Icons.phone), // You can customize the icon here
                                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                          prefixIcon: Icon(Icons.lock), // You can customize the icon here
                                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                          fillColor: AppColors.inputBackground(),
                                          filled: true,
                                        ),
                                      ),

// Confirm Password Field
                                      TextField(
                                        controller: confirmPasswordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: 'confirm password',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0), // Optional: rounded border
                                          ),
                                          prefixIcon: Icon(Icons.lock_outline), // You can customize the icon here
                                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                          fillColor: AppColors.inputBackground(),
                                          filled: true,
                                        ),
                                      ),
                                      MaterialButton(onPressed: (){
                                              doRegister();
                                      },
                                        color: AppColors.accentColor(),
                                        textColor: AppColors.textColor(),
                                        child: Text("Let's do"),
                                      )
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

  Future<void> doRegister() async {
      print(email + " " + mobile + " " + password + " " + confirmPassword);
      String apiAddress = Base.getAddress() + "register.php";
      //http://theeasylearnacademy.com/shop/ws/register.php?email=kenil@gmail.com&password=123123&mobile=778899455
      //successfull register
      //[{"error":"no"},{"success":"yes"},{"message":"registered successfully"}]

      //unsucessfull attempt
      // [{"error":"no"},{"success":"no"},{"message":"email or mobile is already register with us"}]

     // incase if input is missing
     //[{"error":"input is missing"}]
     Uri url = Uri.parse(apiAddress);
     HashMap<String,dynamic> form = new HashMap();
     form['email'] = email;
     form['password'] = password;
     form['mobile'] = mobile;
     var response = await http.post(url,body: form);
     print(response.body);
     try
     {
       var data = json.decode(response.body);
       print(data);
       String error = data[0]['error'];
       if(error != 'no') //there is an error
       {
           Info.error('error',error);
       }
       else
         {
           String success = data[1]['success'];
           String message = data[2]['message'];
           if(success == 'no')
             Info.error('attention',message);
           else
            {
              Info.message('attention',message);
              //create variable inside storage
              storage.write(key: 'userid', value: '-1');
              //redirect Login Screen
              Get.off(new Login());
              
            }
         }
     }
     on Exception catch(error)
     {
        Info.error('error',Info.CommonError);
     }
  }
}