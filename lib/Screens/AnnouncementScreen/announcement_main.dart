import 'package:flutter/material.dart';
import 'package:my_guardian/Helpers/Utils.dart';
import 'package:my_guardian/Model/Announcement.dart';
import 'package:my_guardian/Providers/announcement_provider.dart';
import 'package:my_guardian/Widgets/main_widget.dart';
import 'package:provider/provider.dart';

class AnnouncementHome extends StatefulWidget {
  @override
  _AnnouncementHomeState createState() => _AnnouncementHomeState();
}

class _AnnouncementHomeState extends State<AnnouncementHome> {
  List<Announcement> annList = [];

  @override
  void initState() {
    Provider.of<AnnouncementProvider>(context, listen: false).fetchAnnouncement(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Announcement"),
        centerTitle: false,
      ),
      body: MainWidget(currentPage: Consumer<AnnouncementProvider>(builder: (context, sea, child){
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: sea.announcement == null ? 0 : sea.announcement.length,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemBuilder: (BuildContext context, int index){
                    Announcement announcement = sea.announcement[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 4,
                                  offset: Offset(2,4)
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Utils.getCatColor(announcement.Category),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                          child: Text(announcement.Category, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                                        )),
                                  ),
                                  SizedBox(width: 15,),
                                  Text(announcement.StartDate)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(2, 10, 5,10),
                                child: Text(announcement.Description, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.75), fontSize: 15, letterSpacing: 0.6),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text(announcement.StartDate, style: TextStyle(color: Colors.black54),),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        );
      },),)
    );
  }
}


