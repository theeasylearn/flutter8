import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = '', password = '';

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

  void doLogin() {
    print("Email: $email, Password: $password");
  }
}
