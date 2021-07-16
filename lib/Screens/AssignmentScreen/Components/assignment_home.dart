import 'package:flutter/material.dart';
import 'package:my_guardian/Helpers/Utils.dart';
import 'package:my_guardian/Model/Assignment.dart';
import 'package:my_guardian/Providers/assignment_provider.dart';
import 'package:my_guardian/Screens/AssignmentScreen/Components/view_assignment.dart';
import 'package:my_guardian/Screens/AssignmentScreen/Widgets/assignment_list.dart';
import 'package:my_guardian/Widgets/main_widget.dart';
import 'package:provider/provider.dart';

class AssignmentHome extends StatefulWidget {
  @override
  _AssignmentHomeState createState() => _AssignmentHomeState();
}

class _AssignmentHomeState extends State<AssignmentHome> {

  @override
  void initState() {
    Provider.of<AssignmentProvider>(context, listen: false).fetchAssignmentsBySid(context);
    super.initState();
  }

  void onPressed(Assignment assig, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return ViewAssignment(assig: assig,index: index,);
    }));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Utils.fromHex("#fff8fa"),
        appBar: AppBar(
          title: Text("Assignment"),
          // leadingWidth: 25,
          // leading: Padding(
          //   padding: const EdgeInsets.only(left: 5),
          //   child: Icon(Icons.arrow_back, color: Colors.black87),
          // ),
          centerTitle: false,
          elevation: 0,
          actions: [

          ],
          // bottom: PreferredSize(
          //   preferredSize: Size.fromHeight(72.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(left: 10),
          //         child: Row(
          //           children: [
          //             Expanded(
          //               child: TextField(
          //                 decoration: InputDecoration(
          //                   hintText: "Search",
          //                   fillColor: Theme.of(context).dividerColor.withOpacity(0.07),
          //                   filled: true,
          //                   contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide.none,
          //                     borderRadius: const BorderRadius.all(Radius.circular(10)),
          //                   ),
          //                   suffixIcon: InkWell(
          //                     onTap: () {
          //
          //                     },
          //                     child: Container(
          //                       // padding: EdgeInsets.all(defaultPadding * 0.75),
          //                       // margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          //                       decoration: BoxDecoration(
          //                         color: Utils.facebookBlue,
          //                         borderRadius: const BorderRadius.all(Radius.circular(10)),
          //                       ),
          //                       child: Icon(Icons.search, color: Colors.white,),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             InkWell(
          //               onTap: () {
          //
          //               },
          //               child: Container(
          //                 padding: EdgeInsets.all(defaultPadding * 0.75),
          //                 margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          //                 decoration: BoxDecoration(
          //                   color: Colors.orange,
          //                   borderRadius: const BorderRadius.all(Radius.circular(10)),
          //                 ),
          //                 child: Icon(Icons.sort, color: Colors.white,),
          //               ),
          //             ),
          //
          //           ],
          //         ),
          //       ),
          //       SizedBox(height: 10,),
          //
          //     ],
          //   ),
          // ),
          // backgroundColor: Colors.white,
        ),
        body: MainWidget(currentPage: Consumer<AssignmentProvider>(builder: (context, tClass, child){
          return  AssignmentList(from: "na", assignments: tClass.assignments, onPressed: (assig, index){ onPressed(assig, index);},);
        },),)
    );
  }
}
