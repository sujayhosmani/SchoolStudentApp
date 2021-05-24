import 'package:flutter/material.dart';
import 'package:my_guardian/Screens/DemoHome/Widget/input.dart';
import 'package:my_guardian/Screens/DemoHome/demohome.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController mUserName = TextEditingController();

  onLoginPressed(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return HomeDemo(username: mUserName.text,);
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
        body: Container(
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
    );
  }
}














