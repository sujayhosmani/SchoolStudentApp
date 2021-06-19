import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_guardian/Providers/assignment_provider.dart';
import 'package:my_guardian/Providers/time_table_provider.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:my_guardian/Providers/todyclass_provider.dart';
import 'package:my_guardian/Screens/LoginScreen/Components/login_screen.dart';
import 'package:provider/provider.dart';


import 'Helpers/auth_service.dart';
import 'Meeting/meeting_main.dart';
import 'Providers/global_provider.dart';
import 'Providers/student_provider.dart';
import 'Screens/AssignmentScreen/Widgets/image_upload.dart';
import 'Screens/NavScreen/Component/nav_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AuthService appAuth = new AuthService();

  Widget _defaultHome = new LoginScreen();

  bool _result = await appAuth.login();
  if (_result) {
    _defaultHome = new NavScreen();
  }
  runApp(MyApp(home: _defaultHome,));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Widget home;

  const MyApp({Key key, this.home}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GlobalProvider()),
        ChangeNotifierProvider(create: (context) => StudentProvider()),
        ChangeNotifierProvider(create: (context) => TodayClassProvider()),
        ChangeNotifierProvider(create: (context) => AssignmentProvider()),
        ChangeNotifierProvider(create: (context) => TimeTableProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: Colors.black87,),
        ),
        home: home,
      ),
    );
  }
}

