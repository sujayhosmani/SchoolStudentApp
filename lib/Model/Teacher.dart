import 'package:json_annotation/json_annotation.dart';

import 'Address.dart';


// @JsonSerializable()
class Teacher{
  final String Id;
  final String TeacherId;
  final String FirstName;
  final String Gender;
  final String DateOfBirth;
  final String TeacherPh;
  final String DateOfJoining;
  final String Qualification;
  final String Experience;
  final bool isCTR;
  final String isCTRClass;
  final String isCTRSection;
  final Address PermanentAddress;
  final List<TeacherSubjects> TSubjects;
  final String ImageUrl;
  final Address CurrentAddress;
  final String Description;
  final String Email;
  final String Password;
  final String LastName;

  Teacher({this.Id, this.TeacherId, this.FirstName, this.Gender, this.DateOfBirth, this.TeacherPh, this.DateOfJoining, this.Qualification,
      this.Experience, this.isCTR, this.isCTRClass, this.isCTRSection, this.PermanentAddress, this.TSubjects, this.ImageUrl, this.CurrentAddress,
      this.Description, this.Email, this.Password, this.LastName});

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}

// @JsonSerializable()
class TeacherSubjects
{
  final String subject;

  TeacherSubjects({this.subject});
// final List<TeacherClasses> classes;

  factory TeacherSubjects.fromJson(Map<String, dynamic> json) =>
      _$TeacherSubjectsFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherSubjectsToJson(this);
}


class TeacherClasses
{
  final String Std;
  final String Section;

  TeacherClasses({this.Std, this.Section});

  factory TeacherClasses.fromJson(Map<String, dynamic> json) =>
      _$TeacherClassesFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherClassesToJson(this);
}














Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return Teacher(
    Id: json['Id'] as String,
    TeacherId: json['TeacherId'] as String,
    FirstName: json['FirstName'] as String,
    Gender: json['Gender'] as String,
    DateOfBirth: json['DateOfBirth'] as String,
    TeacherPh: json['TeacherPh'] as String,
    DateOfJoining: json['DateOfJoining'] as String,
    Qualification: json['Qualification'] as String,
    Experience: json['Experience'] as String,
    isCTR: json['isCTR'] as bool,
    isCTRClass: json['isCTRClass'] as String,
    isCTRSection: json['isCTRSection'] as String,
    PermanentAddress: Address.fromJson(json['PermanentAddress'] as Map<String, dynamic>),
    TSubjects: json['TSubjects'] == null ? null : (json['TSubjects'] as List<dynamic>).map((e) => TeacherSubjects.fromJson(e as Map<String, dynamic>)).toList(),
    ImageUrl: json['ImageUrl'] as String,
    CurrentAddress: json['CurrentAddress'] == null ? null :
    Address.fromJson(json['CurrentAddress'] as Map<String, dynamic>),
    Description: json['Description'] as String,
    Email: json['Email'] as String,
    Password: json['Password'] as String,
    LastName: json['LastName'] as String,
  );
}

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
  'Id': instance.Id,
  'TeacherId': instance.TeacherId,
  'FirstName': instance.FirstName,
  'Gender': instance.Gender,
  'DateOfBirth': instance.DateOfBirth,
  'TeacherPh': instance.TeacherPh,
  'DateOfJoining': instance.DateOfJoining,
  'Qualification': instance.Qualification,
  'Experience': instance.Experience,
  'isCTR': instance.isCTR,
  'isCTRClass': instance.isCTRClass,
  'isCTRSection': instance.isCTRSection,
  'PermanentAddress': instance.PermanentAddress,
  'TSubjects': instance.TSubjects,
  'ImageUrl': instance.ImageUrl,
  'CurrentAddress': instance.CurrentAddress,
  'Description': instance.Description,
  'Email': instance.Email,
  'Password': instance.Password,
  'LastName': instance.LastName,
};

TeacherSubjects _$TeacherSubjectsFromJson(Map<String, dynamic> json) {
  return TeacherSubjects(
    subject: json['subject'] as String,
  );
}

Map<String, dynamic> _$TeacherSubjectsToJson(TeacherSubjects instance) =>
    <String, dynamic>{
      'subject': instance.subject,
    };

TeacherClasses _$TeacherClassesFromJson(Map<String, dynamic> json) {
  return TeacherClasses(
    Std: json['Std'] as String,
    Section: json['Section'] as String,
  );
}

Map<String, dynamic> _$TeacherClassesToJson(TeacherClasses instance) =>
    <String, dynamic>{
      'Std': instance.Std,
      'Section': instance.Section,
    };
