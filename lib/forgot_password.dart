import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';
class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}
class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  String email = '';

  @override
  void initState() {
    super.initState();

    // Listener for emailController
    emailController.addListener(() {
      if (emailController.text != null && emailController.text.isNotEmpty) {
        email = emailController.text.trim();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Forgot Password",
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkPrimary(),
          title: Text("Online Shop app"),
        ),
        body: Material(
          child: LayoutBuilder(
            builder: (context, parent) {
              return Column(
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
                      child: Image.asset('images/forgot-password.png'),
                    ),
                  ),
                  SizedBox(
                    width: parent.maxWidth,
                    height: parent.maxHeight * 0.50,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          // Email Field
                          TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Your email',
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
                          SizedBox(
                            height: 10,
                          ),
                          // Recover Account Button
                          Container(
                            width: parent.maxWidth,
                            child: MaterialButton(
                              onPressed: () {
                                recoverAccount();
                              },
                              color: AppColors.accentColor(),
                              textColor: AppColors.textColor(),
                              child: Text("Recover Account"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void recoverAccount() {
    print("Recovering account for email: $email");
  }
}
