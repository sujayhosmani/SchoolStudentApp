import 'package:flutter/material.dart';
import 'package:my_guardian/Helpers/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  onLogoutClicked(BuildContext context){
    AuthService authService = new AuthService();
    authService.logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
            onLogoutClicked(context);
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
