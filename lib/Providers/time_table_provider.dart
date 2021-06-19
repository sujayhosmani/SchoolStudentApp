import 'package:flutter/material.dart';


class TimeTableProvider with ChangeNotifier {
  int selectedIndex = 0;
  List<String> headerArray = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  ScrollController controller = ScrollController();

  TimeTableProvider() {
    selectedIndex = 0;
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