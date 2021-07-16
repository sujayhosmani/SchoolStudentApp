import 'package:flutter/material.dart';
import 'package:my_guardian/Helpers/Utils.dart';
import 'package:my_guardian/Model/TimeTable.dart';
import 'package:my_guardian/Providers/todyclass_provider.dart';
import 'package:provider/provider.dart';


class ShowTodayClassList extends StatelessWidget {
  final List<TimeTable> timeTable;
  final Function(TimeTable, int, String) onPressed;
  final String from;

  const ShowTodayClassList({Key key, this.timeTable, this.onPressed, this.from = "na"}) : super(key: key);


  checkStatus(val){
    if(val == "Join" || val == "Resume"){
      return true;
    }else{
      return false;
    }
  }

  getColor(val){
    if(val == "Waiting"){
      return Colors.orange.shade300;
    }else if(val == "Not started yet"){
      return Colors.redAccent;
    }else if(val == "Join" || val == "Resume"){
      return Colors.blue;
    }else if(val == "Absent" || val == "NA Absent"){
      return Colors.red.shade300;
    }else if(val == "Attended" || val == "NA Attended"){
      return Colors.green.shade300;
    }else{
      return Colors.grey;
    }
  }


  @override
  Widget build(BuildContext context) {
    return timeTable == null ? SizedBox.shrink() : timeTable.length == 0 ?  Text("No classes for today! enjoy your holiday", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)) :
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        timeTable == null  ? SizedBox.shrink() : Text(timeTable[0]?.weekSub[0]?.Week, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
        Expanded(
          child: ListView.builder(
              itemCount: timeTable?.length,
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              // physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index){
                String sub = Provider.of<TodayClassProvider>(context, listen: false).getSubjectById(timeTable[index].weekSub[0].SubjectId)?.Subject;
                return Column(
                  children: [
                    ListTile(
                      trailing: TextButton(child: Text(timeTable[index].weekSub[0].Status, style: TextStyle(color: getColor(timeTable[index].weekSub[0].Status)),), onPressed:  checkStatus(timeTable[index].weekSub[0].Status) ? () => onPressed(timeTable[index], index, from) : null,),
                      onTap: () {print("d");},
                      title:  timeTable == null ? SizedBox.shrink() :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sub != null ? Text(sub) : SizedBox.shrink(),
                        ],
                      ),

                      subtitle: timeTable == null ? SizedBox.shrink() :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Utils.convertTime(timeTable[index].FromTime) + " - " + Utils.convertTime(timeTable[index].EndTime)),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 2,),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
