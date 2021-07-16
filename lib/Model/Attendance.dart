import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
class Attendance{
  final String Id;
  final String OnlineClassId;
  final String CurrentDate;
  final String StudentName;
  final String SubjectId;
  final String StudentId;
  final String Std;
  final String Section;
  final String TeacherName;
  final String Tid;
  final String StartTime;
  final String EndTime;
  final String ActualStartTime;
  final String ActualEndTime;
  final String Duration;
  final String SubjectName;

  Attendance({this.ActualStartTime, this.ActualEndTime, this.Id, this.OnlineClassId, this.CurrentDate, this.StudentName, this.SubjectId, this.StudentId, this.Std, this.Section, this.TeacherName, this.Tid, this.StartTime, this.EndTime, this.Duration, this.SubjectName});

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
  Map<String, dynamic> toJson() => _$AttendanceToJson(this);

}


Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return Attendance(
    Id: json['Id'] as String,
    OnlineClassId: json['OnlineClassId'] as String,
    CurrentDate: json['CurrentDate'] as String,
    StudentName: json['StudentName'] as String,
    SubjectId: json['SubjectId'] as String,
    StudentId: json['StudentId'] as String,
    Std: json['Std'] as String,
    Section: json['Section'] as String,
    TeacherName: json['TeacherName'] as String,
    Tid: json['Tid'] as String,
    StartTime: json['StartTime'] as String,
    EndTime: json['EndTime'] as String,
    ActualStartTime: json['ActualStartTime'] as String,
    ActualEndTime: json['ActualEndTime'] as String,
    Duration: json['Duration'] as String,
    SubjectName: json['SubjectName'] as String,
  );
}

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'OnlineClassId': instance.OnlineClassId,
      'CurrentDate': instance.CurrentDate,
      'StudentName': instance.StudentName,
      'SubjectId': instance.SubjectId,
      'StudentId': instance.StudentId,
      'Std': instance.Std,
      'Section': instance.Section,
      'TeacherName': instance.TeacherName,
      'Tid': instance.Tid,
      'StartTime': instance.StartTime,
      'EndTime': instance.EndTime,
      'ActualStartTime': instance.ActualStartTime,
      'ActualEndTime': instance.ActualEndTime,
      'Duration': instance.Duration,
      'SubjectName': instance.SubjectName,
    };
