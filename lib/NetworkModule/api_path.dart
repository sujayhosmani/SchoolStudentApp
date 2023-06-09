
enum APIPath {
  fetch_student,
  fetch_today,
  add_attendance,
  getAllSubjects,
  getAssignmentsBySid,
  getSubmittedAssignment,
  add_submittedAssignment,
  getAnnouncement,
  fetch_time_table,
  fetch_attendance,
}

class APIPathHelper{
  static String getValue(APIPath path, String param){
    switch(path){
      case APIPath.fetch_student:
        return "school/getByPh/" + param;
      case APIPath.fetch_today:
        return "TimeTable/GetTodayClassStudent" + param;
      case APIPath.fetch_time_table:
        return "TimeTable/getTimeTable" + param;
      case APIPath.fetch_attendance:
        return "TimeTable/GetAttendance" + param;
      case APIPath.getAnnouncement:
        return "announcement/getAAnnouncement" + param;
      case APIPath.add_attendance:
        return "timetable/AddAttendance";
      case APIPath.getAllSubjects:
        return "TimeTable/getSubjects";
      case APIPath.getAssignmentsBySid:
        return "assignment/GetAssignmentsByClass/" + param;
      case APIPath.getSubmittedAssignment:
        return "assignment/getSubmittedAssignment/" + param;
      case APIPath.add_submittedAssignment:
        return "assignment/submitAssignment";
      default:
        return "";
    }
  }
}
