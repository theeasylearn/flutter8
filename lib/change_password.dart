import 'package:flutter/material.dart';
import 'package:online_shop_app/common.dart';

class ChangePassword extends StatefulWidget {

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  String currentPassword = '';
  String newPassword = '';
  String confirmNewPassword = '';

  @override
  void initState() {
    super.initState();

    // Listener for current password
    currentPasswordController.addListener(() {
      if (currentPasswordController.text != null &&
          currentPasswordController.text.isNotEmpty) {
        currentPassword = currentPasswordController.text.trim();
      }
    });

    // Listener for new password
    newPasswordController.addListener(() {
      if (newPasswordController.text != null &&
          newPasswordController.text.isNotEmpty) {
        newPassword = newPasswordController.text.trim();
      }
    });

    // Listener for confirm new password
    confirmNewPasswordController.addListener(() {
      if (confirmNewPasswordController.text != null &&
          confirmNewPasswordController.text.isNotEmpty) {
        confirmNewPassword = confirmNewPasswordController.text.trim();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Change Password",
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
                    width: parent.maxWidth,
                    height: parent.maxHeight * 0.40,
                    child: Container(
                      alignment: Alignment.center,
                      color: AppColors.lightPrimary(),
                      child: CircleAvatar(
                        radius: 50,
                        child: Image.asset('images/change_password.png'),
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
                          Text(
                            "Change Password",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          // Current Password Field
                          TextField(
                            controller: currentPasswordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Current Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              prefixIcon: Icon(Icons.lock),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              fillColor: AppColors.inputBackground(),
                              filled: true,
                            ),
                          ),
                          // New Password Field
                          TextField(
                            controller: newPasswordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'New Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              prefixIcon: Icon(Icons.lock),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              fillColor: AppColors.inputBackground(),
                              filled: true,
                            ),
                          ),
                          // Confirm New Password Field
                          TextField(
                            controller: confirmNewPasswordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm New Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              prefixIcon: Icon(Icons.lock),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              fillColor: AppColors.inputBackground(),
                              filled: true,
                            ),
                          ),
                          // Save Changes Button
                          MaterialButton(
                            onPressed: () {
                              saveChanges();
                            },
                            color: AppColors.accentColor(),
                            textColor: AppColors.textColor(),
                            child: Text("Save Changes"),
                          ),
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

  void saveChanges() {
    print("Current Password: $currentPassword");
    print("New Password: $newPassword");
    print("Confirm New Password: $confirmNewPassword");
  }
}
