

import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
class Assignment{
  final String Id;
  final String Title;
  final String Description;
  final String SubjectId;
  final String SubjectName;
  final String Tid;
  final String TeacherName;
  final String Std;
  final String Section;
  final String StartDate;
  final String EndDate;
  final String Status;
  final String TotalMarks;


  Assignment({this.TotalMarks, this.Id, this.Title, this.Description, this.SubjectId, this.SubjectName, this.Tid, this.TeacherName, this.Std, this.Section, this.StartDate, this.EndDate, this.Status});


  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);
  Map<String, dynamic> toJson() => _$AssignmentToJson(this);

}

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  return Assignment(
    Id: json['Id'] as String,
    Title: json['Title'] as String,
    Description: json['Description'] as String,
    SubjectId: json['SubjectId'] as String,
    SubjectName: json['SubjectName'] as String,
    Tid: json['Tid'] as String,
    TeacherName: json['TeacherName'] as String,
    Std: json['Std'] as String,
    Section: json['Section'] as String,
    StartDate: json['StartDate'] as String,
    EndDate: json['EndDate'] as String,
    Status: json['Status'] as String,
    TotalMarks: json['TotalMarks'] as String,

  );
}

Map<String, dynamic> _$AssignmentToJson(Assignment instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Title': instance.Title,
      'Description': instance.Description,
      'SubjectId': instance.SubjectId,
      'SubjectName': instance.SubjectName,
      'Tid': instance.Tid,
      'TeacherName': instance.TeacherName,
      'Std': instance.Std,
      'Section': instance.Section,
      'StartDate': instance.StartDate,
      'EndDate': instance.EndDate,
      'Status': instance.Status,
      'TotalMarks': instance.TotalMarks,
    };
