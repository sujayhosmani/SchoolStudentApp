import 'package:flutter/material.dart';
import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/Providers/global_provider.dart';
import 'package:my_guardian/Providers/student_provider.dart';
import 'package:my_guardian/Screens/HomeScreen/Components/home_screen.dart';
import 'package:my_guardian/Screens/NavScreen/Component/nav_screen.dart';

import 'package:my_guardian/Widgets/input.dart';
import 'package:my_guardian/Widgets/loading_dialog.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController mUserName = TextEditingController();

  onLoginPressed(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return HomeScreen();
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login",style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green.withOpacity(0.8),
        // leading: Icon(Icons.home,),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/clogo.png", height: 100,),
                SizedBox(height: 5,),
                Text("My guardian", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),),
                SizedBox(height: 30,),

                SizedBox(height: 10,),
                InputText(title: "Enter Username",),
                InputText(title: "Password",isPassword: true,),
                SizedBox(height: 20,),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120),
                        color: Colors.grey
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(

                        ),
                        onPressed: (){onLoginPressed();},
                        child: Text("Login")))

              ],
            ),
          ),
          Consumer<GlobalProvider>(builder: (context, global, child){
            print(global.error);
            return LoadingScreen(isBusy: global.isBusy,error: global?.error,);
          })
        ],
      ),
    );
  }

  void onLoginClicked(BuildContext context) async{
    CustomResponse<Student> res = await Provider.of<StudentProvider>(context, listen: false).studentLogin(context, "8553655890", "login", "aNo");
    if(res.Status == 1 || res.Data != null){
      print(res.Data.Name);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
        return NavScreen();
      }));
    }

  }
}

















