
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class TimeTable{
  final String Id;
  final String Std;
  final String Section;
  final List<WeekSubjects> weekSub;
  final String FromTime;
  final String EndTime;
  final String Duration;
  final String UploadedById;

  TimeTable({this.Id, this.Std, this.Section, this.weekSub, this.FromTime, this.EndTime, this.Duration, this.UploadedById});


  factory TimeTable.fromJson(Map<String, dynamic> json) =>
      _$TimeTableFromJson(json);
  Map<String, dynamic> toJson() => _$TimeTableToJson(this);

}

@JsonSerializable()
class WeekSubjects{
   String Week;
   String CTSId;
   String TId;
   String SubjectId;
   String OnlineClassId;
   String Status;
   int StatusCode;


  WeekSubjects({this.OnlineClassId, this.Status, this.TId, this.SubjectId, this.Week, this.CTSId, this.StatusCode});

  factory WeekSubjects.fromJson(Map<String, dynamic> json) =>
      _$WeekSubjectsFromJson(json);
  Map<String, dynamic> toJson() => _$WeekSubjectsToJson(this);
}

TimeTable _$TimeTableFromJson(Map<String, dynamic> json) {
  return TimeTable(
    Id: json['Id'] as String,
    Std: json['Std'] as String,
    Section: json['Section'] as String,
    weekSub: (json['weekSub'] as List<dynamic>)
        .map((e) => WeekSubjects.fromJson(e as Map<String, dynamic>))
        .toList(),
    FromTime: json['FromTime'] as String,
    EndTime: json['EndTime'] as String,
    Duration: json['Duration'] as String,
    UploadedById: json['UploadedById'] as String,
  );
}

Map<String, dynamic> _$TimeTableToJson(TimeTable instance) => <String, dynamic>{
  'Id': instance.Id,
  'Std': instance.Std,
  'Section': instance.Section,
  'weekSub': instance.weekSub,
  'FromTime': instance.FromTime,
  'EndTime': instance.EndTime,
  'Duration': instance.Duration,
  'UploadedById': instance.UploadedById,
};

WeekSubjects _$WeekSubjectsFromJson(Map<String, dynamic> json) {
  return WeekSubjects(
    Week: json['Week'] as String,
    CTSId: json['CTSId'] as String,
    SubjectId: json['SubjectId'] as String,
    TId: json['TId'] as String,
    OnlineClassId: json['OnlineClassId'] as String,
    Status: json['Status'] as String,
    StatusCode: json['StatusCode'] as int,
  );
}

Map<String, dynamic> _$WeekSubjectsToJson(WeekSubjects instance) =>
    <String, dynamic>{
      'Week': instance.Week,
      'CTSId': instance.CTSId,
      'SubjectId': instance.SubjectId,
      'TId': instance.TId,
      'OnlineClassId': instance.OnlineClassId,
      'Status': instance.Status,
      'StatusCode': instance.StatusCode,
    };
