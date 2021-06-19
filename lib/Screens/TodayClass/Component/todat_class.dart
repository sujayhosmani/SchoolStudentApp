import 'package:flutter/material.dart';
import 'package:my_guardian/Meeting/meeting_main.dart';
import 'package:my_guardian/Model/Attendance.dart';
import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/Model/SubjectModel.dart';
import 'package:my_guardian/Model/TimeTable.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/Providers/global_provider.dart';
import 'package:my_guardian/Providers/student_provider.dart';
import 'package:my_guardian/Providers/todyclass_provider.dart';
import 'package:my_guardian/Screens/TodayClass/Widgets/today_class_view.dart';
import 'package:my_guardian/Widgets/loading_dialog.dart';
import 'package:my_guardian/Widgets/main_widget.dart';
import 'package:provider/provider.dart';

class TodayClassScreen extends StatefulWidget {
  @override
  _TodayClassScreenState createState() => _TodayClassScreenState();
}

class _TodayClassScreenState extends State<TodayClassScreen> {

  String from = "na";
  @override
  void initState() {

    getTodayClass();
    super.initState();
  }

  getTodayClass() async{
    CustomResponse<List<TimeTable>> f = await Provider.of<TodayClassProvider>(context,listen: false).fetchTodayClass(context, "na");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today Classes", ),
        elevation: 0.0,
        centerTitle: false,
      ),
      body: SafeArea(
        child: MainWidget(currentPage: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<TodayClassProvider>(builder: (context, tClass, child){
            return  ShowTodayClassList(from: from, timeTable: tClass.todayClass, onPressed: (online, index, from){ onPressed(online, index, from);},);
          },),
        ))
      ),
    );
  }

  void onPressed(TimeTable online, int index, String from) async{
    print("ddf");
    SubjectModel sub = Provider.of<TodayClassProvider>(context, listen: false).getSubjectById(online.weekSub[0].SubjectId);

    Student stu = Provider.of<StudentProvider>(context, listen: false).student.Data;

    Attendance attendance = Attendance(ActualStartTime: online.FromTime, ActualEndTime: online.EndTime,
        Section: online.Section, Std: online.Std, SubjectName: sub.Subject, SubjectId: online.weekSub[0].SubjectId,
        Tid: online.weekSub[0].TId, OnlineClassId: online.weekSub[0].OnlineClassId, StudentName: stu.Name, TeacherName: "",
        StudentId: stu.Id);

    print("ddf2 " + sub.Subject);
    CustomResponse<Attendance> val = await Provider.of<TodayClassProvider>(context, listen: false).addAttendance(context, attendance, index, from);
    print("ddf3 " + val.Status.toString());
    if(val.Status == 1){
      print(val.Data.Id + "Join the room");
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        return Meeting(roomId: online.weekSub[0].OnlineClassId, name: stu.Name,);
      }));
    }else{
      getTodayClass();
    }

  }
}
