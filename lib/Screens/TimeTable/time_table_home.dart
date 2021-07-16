import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_guardian/Helpers/Utils.dart';
import 'package:my_guardian/Model/SubjectModel.dart';
import 'package:my_guardian/Model/TimeTable.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/Providers/time_table_provider.dart';
import 'package:my_guardian/Providers/todyclass_provider.dart';
import 'package:my_guardian/Widgets/main_widget.dart';
import 'package:provider/provider.dart';

class TimeTableHome extends StatefulWidget {
  @override
  _TimeTableHomeState createState() => _TimeTableHomeState();
}

class _TimeTableHomeState extends State<TimeTableHome> {

  @override
  void initState() {
    getTodayClass();
    super.initState();
  }

  getTodayClass() async{
    await Provider.of<TimeTableProvider>(context,listen: false).fetchTimeTable(context, "na");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("TimeTable"),
        centerTitle: false,
      ),
      body: MainWidget(currentPage: Consumer2<TimeTableProvider, TodayClassProvider>(builder: (context, sea, subPro, child){
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 75,
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: ListView.builder(
                    controller: sea.controller,
                    itemCount: sea.headerArray.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int indexFirsr) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PhysicalModel(
                            color: sea.selectedIndex == indexFirsr ? Colors.green.shade500 : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            elevation: sea.selectedIndex == indexFirsr ? 5 : 0,
                            shadowColor: Colors.green,
                            shape: BoxShape.rectangle,
                            child: InkWell(
                              onTap: (){
                                sea.onChangeWeek(indexFirsr);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                                child: Text(sea.headerArray[indexFirsr], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color:  sea.headerArray[indexFirsr] == "Sat" || sea.headerArray[indexFirsr] == "Sun" ? sea.selectedIndex == indexFirsr ? Colors.white : Colors.red.withOpacity(0.8) : sea.selectedIndex == indexFirsr ? Colors.white : Colors.black.withOpacity(0.8)),),
                              ),
                            ),
                          ),
                          SizedBox(width: 4,)
                        ],
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(),
            ),
            sea.timeTable == null ? SizedBox.shrink() :  Expanded(
                child: ListView.builder(
                    itemCount: sea.timeTable.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      String subject = getSubject2(sea.timeTable[index], index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(Utils.convertTime(sea.timeTable[index].FromTime), style: TextStyle(fontSize: 14, color: Colors.black54),),
                                Text(Utils.convertTime(sea.timeTable[index].EndTime), style: TextStyle(fontSize: 14, color: Colors.black54),),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                                margin: const EdgeInsets.fromLTRB(20,0,10,0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Utils.getSubColor(subject ?? ""),
                                ),
                                child: Text(subject ?? "", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                )
            ),

          ],
        );
      },),),
    );
  }


  String getSubject2(TimeTable timeTable, int index) {
    int selectedIndex = Provider.of<TimeTableProvider>(context, listen: false).selectedIndex;
    String val = Provider.of<TodayClassProvider>(context, listen: false).getSubjectById(timeTable.weekSub[selectedIndex].SubjectId)?.Subject;
    return val;
  }
}
