import 'package:flutter/material.dart';
import 'package:my_guardian/Model/Assignment.dart';
import 'package:provider/provider.dart';


class AssignmentList extends StatelessWidget {
  final List<Assignment> assignments;
  final Function(Assignment, int) onPressed;
  final String from;

  const AssignmentList({Key key, this.assignments, this.onPressed, this.from = "na"}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return assignments == null  ? SizedBox.shrink() :
    assignments.length == 0  ? Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("No Assignments Yet", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
    ) :
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: assignments?.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              padding: EdgeInsets.only(bottom: 45, top: 12),
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index){
                Assignment assig = assignments[index];
                return GestureDetector(
                  onTap: (){
                    onPressed(assig, index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade300,
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                                    child: Text(assig.SubjectName, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
                                                  )),
                                            ],
                                          ),
                                        ),

                                        Container(
                                          alignment: Alignment.topRight,
                                          child: Text(assig.Std + "th " + assig.Section, style: TextStyle(color: Colors.black87),),
                                        )

                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Text(assig.Title, style: TextStyle(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.w600),),
                                    SizedBox(height: 6,),
                                    Text(assig.Description),
                                    SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              border: Border.all(color: Colors.orange, width: 0.4),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                            child: Text(assig.Status, style: TextStyle(fontSize: 12, color: Colors.black87),),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.teal.shade300,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                              child: Text(assig.EndDate, style: TextStyle(fontSize: 12, color: Colors.white),),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
