import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';

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

  void doRegister() {
      print(email + " " + mobile + " " + password + " " + confirmPassword);
  }
}