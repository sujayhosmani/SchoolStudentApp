
enum APIPath {
  fetch_student,
}

class APIPathHelper{
  static String getValue(APIPath path, String param){
    switch(path){
      case APIPath.fetch_student:
        return "school/getByPh/" + param;
      default:
        return "";
    }
  }
}
