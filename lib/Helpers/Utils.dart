import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_guardian/Model/Grid.dart';

  class Utils {
    static const Color scaffold = Color(0xFFF0F2F5);
    static const double padding = 20;
    static const double avatarRadius = 45;
    static const Color facebookBlue = Color(0xFF1777F2);
    static Color peach = fromHex("#F67B5A");
    static String ntImg = 'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80';
    static const LinearGradient createRoomGradient = LinearGradient(
      colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
    );

    static const LinearGradient storyGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black87],
    );

    static getSubColor(String sub){
      if(sub.toLowerCase().contains(("kan"))){
        return fromHex("#7b9acf");
      }else if(sub.toLowerCase().contains(("hin"))){
        return fromHex("#f5c268");
      }else if(sub.toLowerCase().contains(("eng"))){
        return fromHex("#66c8c6");
      }else if(sub.toLowerCase().contains(("mat"))){
        return fromHex("#f8a3b8");
      }else if(sub.toLowerCase().contains(("sci"))){
        return fromHex("#faad91");
      }else if(sub.toLowerCase().contains(("soc"))){
        return fromHex("#7391c3");
      }else{
        return fromHex("#faad91");
      }

    }

    static getCatColor(String sub){
      if(sub.toLowerCase().contains(("aca"))){
        return  Colors.blue.shade300;
      }else if(sub.toLowerCase().contains(("spor"))){
        return Colors.orange.shade300;
      }else if(sub.toLowerCase().contains(("sub"))){
        return Colors.red.shade300;
      }else if(sub.toLowerCase().contains(("exa"))){
        return Colors.brown.shade300;
      }else if(sub.toLowerCase().contains(("fee"))){
        return Colors.purple.shade300;
      }else if(sub.toLowerCase().contains(("othe"))){
        return Colors.blue.shade300;
      }else{
        return Colors.blue.shade300;
      }

    }
    

    static  LinearGradient btnGradient = LinearGradient(
      begin: Alignment(-1.0, -4.0),
      end: Alignment(1.0, 4.0),
      colors: [fromHex("#FFA81D"), fromHex("#F45C43")],
    );

    static String convertTime(String dateTime){
      DateTime tempDate = new DateFormat("hh:mm").parse(dateTime);
      String s = DateFormat("h:mm a").format(tempDate);
      return s;
    }

    static Color fromHex(String hexString) {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    }
    
    static List<GridModel> getGrids(){
      List<GridModel> grid = [
          new GridModel(title: "Today Classes", des: "", image: "assets/images/presentation.png"),
          new GridModel(title: "Time Table", des: "", image: "assets/images/timetable.png"),
          new GridModel(title: "Attendance", des: "", image: "assets/images/attendance.png"),
        new GridModel(title: "Assignments", des: "", image: "assets/images/attendance.png"),
        new GridModel(title: "Announcement", des: "", image: "assets/images/timetable.png"),
        new GridModel(title: "Digital Library", des: "", image: "assets/images/timetable.png"),

      ];
      return grid;
    }
  }