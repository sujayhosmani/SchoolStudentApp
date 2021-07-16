import 'package:json_annotation/json_annotation.dart';

// part 'OverAll.g.dart';
//
// @JsonSerializable()
class OverAll{
  final String Subject;
  final String SubjectId;
  final int Total;
  final int Present;
  final int Absent;

  OverAll({this.Subject, this.SubjectId, this.Total, this.Present, this.Absent});

  factory OverAll.fromJson(Map<String, dynamic> json) =>
      _$OverAllFromJson(json);
  Map<String, dynamic> toJson() => _$OverAllToJson(this);
}


OverAll _$OverAllFromJson(Map<String, dynamic> json) {
  return OverAll(
    Subject: json['Subject'] as String,
    SubjectId: json['SubjectId'] as String,
    Total: json['Total'] as int,
    Present: json['Present'] as int,
    Absent: json['Absent'] as int,
  );
}

Map<String, dynamic> _$OverAllToJson(OverAll instance) => <String, dynamic>{
  'Subject': instance.Subject,
  'SubjectId': instance.SubjectId,
  'Total': instance.Total,
  'Present': instance.Present,
  'Absent': instance.Absent,
};
