
import 'package:flutter/material.dart';
import 'package:my_guardian/Model/Announcement.dart';
import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/Providers/student_provider.dart';
import 'package:my_guardian/Repositories/student_repo.dart';
import 'package:provider/provider.dart';


class AnnouncementProvider with ChangeNotifier {
  StudentRepository _todayClassRepository;
  List<Announcement> _announcement;

  List<Announcement> get announcement => _announcement;


  AnnouncementProvider() {
    _todayClassRepository = StudentRepository();
    // fetchAssignmentsByTid(null);
  }

  fetchAnnouncement(BuildContext context) async {
    Student stu = Provider.of<StudentProvider>(context, listen: false).student.Data;
    CustomResponse<List<Announcement>> assignment = await _todayClassRepository.fetchAnnouncement(context, stu.Class, stu.Section);
    print(assignment.Data);
    _announcement = assignment?.Data;
    _announcement.sort((a, b) => a.StartDate.compareTo(b.StartDate));
    notifyListeners();
    // return todayTimeTable;
  }



}