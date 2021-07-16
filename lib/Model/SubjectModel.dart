

import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
class SubjectModel{
  final String Id;
final int SubjectCode;
final String Subject;

  SubjectModel({this.Id, this.SubjectCode, this.Subject});

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
}



SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) {
  return SubjectModel(
    Id: json['Id'] as String,
    SubjectCode: json['SubjectCode'] as int,
    Subject: json['Subject'] as String,
  );
}

Map<String, dynamic> _$SubjectModelToJson(SubjectModel instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'SubjectCode': instance.SubjectCode,
      'Subject': instance.Subject,
    };
