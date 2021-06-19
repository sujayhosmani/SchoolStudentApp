
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OnlineClass{
  final String Id;
  final String CurrentDate;
  final String UniqueId;
  final String Status;
  final String Subject;
  final String SubjectCode;
  final String SubjectId;
  final String Topic;
  final String Std;
  final String Section;
  final String Tid;
  final String TeacherName;
  final String TeacherId;
  final String StartTime;
  final String EndTime;
  final String ActualStartTime;
  final String ActualEndTime;
  final String Duration;
  final String CTSId;
  final String Week;

  OnlineClass({this.ActualStartTime, this.ActualEndTime, this.Id, this.CurrentDate, this.Status, this.Subject, this.SubjectCode, this.SubjectId, this.Topic, this.Std, this.Section, this.Tid, this.TeacherName, this.TeacherId, this.StartTime, this.EndTime, this.Duration, this.UniqueId, this.CTSId, this.Week});

  factory OnlineClass.fromJson(Map<String, dynamic> json) =>
      _$OnlineClassFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineClassToJson(this);
}




OnlineClass _$OnlineClassFromJson(Map<String, dynamic> json) {
  return OnlineClass(
    Id: json['Id'] as String,
    CurrentDate: json['CurrentDate'] as String,
    Status: json['Status'] as String,
    Subject: json['Subject'] as String,
    SubjectCode: json['SubjectCode'] as String,
    SubjectId: json['SubjectId'] as String,
    Topic: json['Topic'] as String,
    Std: json['Std'] as String,
    Section: json['Section'] as String,
    Tid: json['Tid'] as String,
    TeacherName: json['TeacherName'] as String,
    TeacherId: json['TeacherId'] as String,
    StartTime: json['StartTime'] as String,
    EndTime: json['EndTime'] as String,
    ActualEndTime: json['ActualEndTime'] as String,
    ActualStartTime: json['ActualStartTime'] as String,
    Duration: json['Duration'] as String,
    CTSId: json['CTSId'] as String,
    Week: json['Week'] as String,
  );
}

Map<String, dynamic> _$OnlineClassToJson(OnlineClass instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'CurrentDate': instance.CurrentDate,
      'Status': instance.Status,
      'Subject': instance.Subject,
      'SubjectCode': instance.SubjectCode,
      'SubjectId': instance.SubjectId,
      'Topic': instance.Topic,
      'Std': instance.Std,
      'Section': instance.Section,
      'Tid': instance.Tid,
      'TeacherName': instance.TeacherName,
      'TeacherId': instance.TeacherId,
      'StartTime': instance.StartTime,
      'EndTime': instance.EndTime,
      'ActualStartTime': instance.ActualStartTime,
      'ActualEndTime': instance.ActualEndTime,
      'Duration': instance.Duration,
      'CTSId': instance.CTSId,
      'Week': instance.Week,
    };