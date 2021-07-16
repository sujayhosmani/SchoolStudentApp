import 'package:flutter/material.dart';
import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/Model/TimeTable.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/Providers/student_provider.dart';
import 'package:my_guardian/Repositories/student_repo.dart';
import 'package:provider/provider.dart';


class TimeTableProvider with ChangeNotifier {
  int selectedIndex = 0;
  StudentRepository _studentRepository;
  List<String> headerArray = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  ScrollController controller = ScrollController();
  List<TimeTable> timeTable;

  TimeTableProvider() {
    _studentRepository = StudentRepository();
    selectedIndex = 0;

  }

  fetchTimeTable(BuildContext context, from) async{
    if (timeTable == null){
      Student stu = Provider.of<StudentProvider>(context, listen: false).student.Data;
      CustomResponse<List<TimeTable>> todayTimeTable = await _studentRepository.fetchTimeTable(context,from, stu.Class, stu.Section);
      timeTable = todayTimeTable?.Data;
      timeTable?.sort((a, b) => a.FromTime.compareTo(b.FromTime));
      notifyListeners();
    }
  }



  onChangeWeek(int index){
    selectedIndex = index;
    controller.animateTo(getScrollValue(), duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    notifyListeners();
  }

  double getScrollValue() {
    if (selectedIndex == 0){
      return  controller.position.minScrollExtent;
    }else if (selectedIndex == 1){
      return  controller.position.minScrollExtent + 10;
    }else if (selectedIndex == 2){
      return controller.position.minScrollExtent + 20;
    }else if (selectedIndex == 3){
      return  controller.position.minScrollExtent + 30;
    }else if (selectedIndex == 4){
      return  controller.position.maxScrollExtent - 30;
    }else if (selectedIndex == 5){
      return  controller.position.maxScrollExtent - 20;
    }else if (selectedIndex == 6){
      return  controller.position.maxScrollExtent - 10;
    }else if (selectedIndex == 7){
      return  controller.position.maxScrollExtent;
    }else{
      return 0;
    }
  }

}