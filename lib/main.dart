import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'Meeting/meeting_main.dart';
import 'Screens/LoginScreen/main_login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Colors.black87,),
      ),
      home: MainLogin(),
    );
  }
}

