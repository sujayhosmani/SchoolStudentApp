import 'package:flutter/material.dart';
import 'package:my_guardian/Helpers/Utils.dart';
import 'package:my_guardian/Screens/DemoHome/Widget/input.dart';

class MainLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Presidency"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child:  Container(
            width: double.infinity,
            // decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey,
            //         blurRadius: 25.0, // soften the shadow
            //         spreadRadius: 5.0, //extend the shadow
            //         offset: Offset(10,5),
            //       )
            //     ],
            //     borderRadius: BorderRadius.circular(10)
            // ),
            margin: EdgeInsets.only(top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/clogo.png", fit: BoxFit.cover, height: 100,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("The Presidency Public School", style: TextStyle(fontSize: 18, ),)),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                  child: Align(alignment: Alignment.topLeft, child: Text("Login", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                ),

                InputText(isPassword: false,title: "Username",icon: Icons.person,),
                SizedBox(height: 5,),
                InputText(isPassword: true,title: "Password",icon: Icons.vpn_key,),
                SizedBox(height: 8,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: Utils.btnGradient
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      // backgroundColor: ,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60)
                        )
                    ),

                    child: new Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 60,),
              ],
            ),
          )
      ),
    );
  }
}
