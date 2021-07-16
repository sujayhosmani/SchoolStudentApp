
// import 'package:json_annotation/json_annotation.dart';
// part 'Announcement.g.dart';
//
// @JsonSerializable()
class Announcement{
  final String Id;
  final String Category;
  final String Description;
  final String UploadedId;
  final String UploadedBy;
  final String StartDate;
  final bool isForSchool;
  final bool isForTeacher;
  final String Subject;
  final List<String> StdSec;

  Announcement({this.isForTeacher, this.Subject, this.Id, this.Category, this.Description, this.UploadedId, this.UploadedBy, this.StartDate, this.isForSchool, this.StdSec});


  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);
  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);

}

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) {
  return Announcement(
    Id: json['Id'] as String,
    Category: json['Category'] as String,
    Description: json['Description'] as String,
    UploadedId: json['UploadedId'] as String,
    UploadedBy: json['UploadedBy'] as String,
    StartDate: json['StartDate'] as String,
    isForSchool: json['isForSchool'] as bool,
    isForTeacher: json['isForTeacher'] as bool,
    Subject: json['Subject'] as String,
    StdSec: (json['StdSec'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$AnnouncementToJson(Announcement instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Category': instance.Category,
      'Description': instance.Description,
      'UploadedId': instance.UploadedId,
      'UploadedBy': instance.UploadedBy,
      'StartDate': instance.StartDate,
      'Subject': instance.Subject,
      'isForTeacher': instance.isForTeacher,
      'isForSchool': instance.isForSchool,
      'StdSec': instance.StdSec,
    };
