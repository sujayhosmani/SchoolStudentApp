import 'package:flutter/material.dart';
import 'package:my_guardian/Helpers/Utils.dart';
import 'package:my_guardian/Providers/time_table_provider.dart';
import 'package:provider/provider.dart';

class TimeTableHome extends StatefulWidget {
  @override
  _TimeTableHomeState createState() => _TimeTableHomeState();
}

class _TimeTableHomeState extends State<TimeTableHome> {
  List<String> subj = ["Kannada", "Hindi", "Maths", "English", "Science", "Social"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("TimeTable"),
        centerTitle: false,
      ),
      body: Consumer<TimeTableProvider>(builder: (context, sea, child){
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
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PhysicalModel(
                            color: sea.selectedIndex == index ? Colors.green.shade500 : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            elevation: sea.selectedIndex == index ? 5 : 0,
                            shadowColor: Colors.green,
                            shape: BoxShape.rectangle,
                            child: InkWell(
                              onTap: (){
                                sea.onChangeWeek(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                                child: Text(sea.headerArray[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color:  sea.headerArray[index] == "Sat" || sea.headerArray[index] == "Sun" ? sea.selectedIndex == index ? Colors.white : Colors.red.withOpacity(0.8) : sea.selectedIndex == index ? Colors.white : Colors.black.withOpacity(0.8)),),
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
            Expanded(
                child: ListView.builder(
                    itemCount: subj.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("8:00", style: TextStyle(fontSize: 15, color: Colors.black54),),
                                Text("AM", style: TextStyle(fontSize: 14, color: Colors.black54),),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                                margin: const EdgeInsets.fromLTRB(20,0,10,0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Utils.getSubColor(subj[index]),
                                ),
                                child: Text(subj[index], style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
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
      },),
    );
  }
}
