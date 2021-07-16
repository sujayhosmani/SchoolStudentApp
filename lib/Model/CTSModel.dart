import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
class CTSModel{
  final String Id;
  final String Section;
  final String Std;
  final String TID;
  final String SubjectId;

  CTSModel({this.Id, this.Section, this.Std, this.TID, this.SubjectId});

  factory CTSModel.fromJson(Map<String, dynamic> json) =>
      _$CTSModelFromJson(json);
  Map<String, dynamic> toJson() => _$CTSModelToJson(this);

}




CTSModel _$CTSModelFromJson(Map<String, dynamic> json) {
  return CTSModel(
    Id: json['Id'] as String,
    Section: json['Section'] as String,
    Std: json['Std'] as String,
    TID: json['TID'] as String,
    SubjectId: json['SubjectId'] as String,
  );
}

Map<String, dynamic> _$CTSModelToJson(CTSModel instance) => <String, dynamic>{
  'Id': instance.Id,
  'Section': instance.Section,
  'Std': instance.Std,
  'TID': instance.TID,
  'SubjectId': instance.SubjectId,
};
