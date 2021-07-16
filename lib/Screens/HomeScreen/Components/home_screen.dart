import 'package:flutter/material.dart';
import 'package:my_guardian/Helpers/Utils.dart';
import 'package:my_guardian/Providers/student_provider.dart';
import 'package:my_guardian/Screens/AnnouncementScreen/announcement_main.dart';
import 'package:my_guardian/Screens/AssignmentScreen/Components/assignment_home.dart';
import 'package:my_guardian/Screens/AttendanceScreen/Components/attendance_home.dart';
import 'package:my_guardian/Screens/HomeScreen/Widgets/grid_main.dart';
import 'package:my_guardian/Screens/TimeTable/time_table_home.dart';
import 'package:my_guardian/Screens/TodayClass/Component/todat_class.dart';
import 'package:my_guardian/Widgets/responsive.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.black87),),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                decoration: BoxDecoration(
                  color: Color(0xFFD4E7FE),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                            text: "Wed",
                            style: TextStyle(
                                color: Color(0XFF263064),
                                fontSize: 12,
                                fontWeight: FontWeight.w900),
                            children: [
                              TextSpan(
                                text: " 10 Oct",
                                style: TextStyle(
                                    color: Color(0XFF263064),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              )
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.2),
                                blurRadius: 12,
                                spreadRadius: 8,
                              )
                            ],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Consumer<StudentProvider>(
                          builder: (context, student, child){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                student.student?.Data == null ? SizedBox.shrink() : Text(
                                  "Hi " + student.student?.Data?.Name,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0XFF343E87),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Here is a list of features",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),

                              ],
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0)
                ),
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(bottom: 60, top: Responsive.isMobile(context) ? 2 : 30, left: 12, right: 12),
                child: GridMain(rep: Utils.getGrids(), onClicked: (val){
                  onClicked(val);
                },),
              )
            ],
          )
      ),
    );
  }

  void onClicked(val) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      switch(val){
        case 0: {
          return TodayClassScreen();
        }
        case 1: {
          return TimeTableHome();
        }
        case 2: {
          return AttendanceHome();
        }
        case 3: {
          return AssignmentHome();
        }
        case 4: {
          return AnnouncementHome();
        }
        default:{
          return TodayClassScreen();
        }
      }
    }));

  }

}