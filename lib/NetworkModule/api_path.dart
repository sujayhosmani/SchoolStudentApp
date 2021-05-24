
enum APIPath {
  fetch_student,
}

class APIPathHelper{
  static String getValue(APIPath path){
    switch(path){
      case APIPath.fetch_student:
        return "/login";
      default:
        return "";
    }
  }
}
