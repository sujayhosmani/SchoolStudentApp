
import 'package:json_annotation/json_annotation.dart';
import 'package:my_guardian/Model/AssignmentFiles.dart';

// @JsonSerializable()
class SubmitAssignments{

  final String Id;
  final String AssignmentId;
  final String ActualDate;
  final String ActualEndDate;
  final String SubmittedDate;
  final List<AssignmentFiles> FileUrls;
  final String StudentName;
  final String Sid;
  final String Std;
  final String Section;
  final String StuImg;
  final String Status;
  final String Remark;
  final String MarksObtained;
  final String TotalMarks;
  final String StudentRemark;

  SubmitAssignments({this.StudentRemark, this.Id, this.AssignmentId, this.ActualDate, this.ActualEndDate, this.SubmittedDate, this.FileUrls, this.StudentName, this.Sid, this.Std, this.Section, this.StuImg, this.Status, this.Remark, this.MarksObtained, this.TotalMarks});

  factory SubmitAssignments.fromJson(Map<String, dynamic> json) =>
      _$SubmitAssignmentsFromJson(json);
  Map<String, dynamic> toJson() => _$SubmitAssignmentsToJson(this);

}

SubmitAssignments _$SubmitAssignmentsFromJson(Map<String, dynamic> json) {
  return SubmitAssignments(
    Id: json['Id'] as String,
    AssignmentId: json['AssignmentId'] as String,
    ActualDate: json['ActualDate'] as String,
    ActualEndDate: json['ActualEndDate'] as String,
    SubmittedDate: json['SubmittedDate'] as String,
    FileUrls: json['FileUrls'] == null
        ? null :  (json['FileUrls'] as List<dynamic>).map((e) => AssignmentFiles.fromJson(e as Map<String, dynamic>)).toList(),
    StudentName: json['StudentName'] as String,
    Sid: json['Sid'] as String,
    Std: json['Std'] as String,
    Section: json['Section'] as String,
    StuImg: json['StuImg'] as String,
    Status: json['Status'] as String,
    Remark: json['Remark'] as String,
    MarksObtained: json['MarksObtained'] as String,
    TotalMarks: json['TotalMarks'] as String,
    StudentRemark: json['StudentRemark'] as String,
  );
}

Map<String, dynamic> _$SubmitAssignmentsToJson(SubmitAssignments instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'AssignmentId': instance.AssignmentId,
      'ActualDate': instance.ActualDate,
      'ActualEndDate': instance.ActualEndDate,
      'SubmittedDate': instance.SubmittedDate,
      'FileUrls': instance.FileUrls,
      'StudentName': instance.StudentName,
      'Sid': instance.Sid,
      'Std': instance.Std,
      'Section': instance.Section,
      'StuImg': instance.StuImg,
      'Status': instance.Status,
      'Remark': instance.Remark,
      'MarksObtained': instance.MarksObtained,
      'TotalMarks': instance.TotalMarks,
      'StudentRemark': instance.StudentRemark,
    };
